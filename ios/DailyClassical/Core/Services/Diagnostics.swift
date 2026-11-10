import Foundation
import MetricKit

/// Crash, hang, CPU and disk-write reports from MetricKit, sent to POST /v1/diagnostics for the
/// admin page (backend routes/diagnostics.ts). iOS hands them over on a later launch (crashes and
/// hangs the next time the app opens, CPU and disk reports about a day later). A report carries the
/// app, build and iOS version, the device model and the call stacks as binary offsets (read on a Mac
/// with ios/scripts/symbolicate.sh); nothing about the person or the install. Reports wait in
/// Application Support until a send succeeds.
@MainActor
final class Diagnostics: NSObject, MXMetricManagerSubscriber {
    static let shared = Diagnostics()

    struct Report: Codable, Sendable {
        let kind: String           // crash, hang, cpu, disk, launch
        let appVersion: String
        let build: String
        let osVersion: String
        let device: String
        let at: Date
        let details: [String: String]
        let callStack: String?     // MXCallStackTree.jsonRepresentation(), as text
    }

    private static let maxQueued = 30
    nonisolated private static let maxStackBytes = 256_000
    private var queue: [Report] = []
    private var sending = false

    private var queueURL: URL {
        let dir = URL.applicationSupportDirectory
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir.appending(path: "diagnostics-queue.json")
    }

    /// From app launch: subscribe, and send anything left from earlier launches.
    func start() {
        queue = (try? Data(contentsOf: queueURL)).flatMap { try? JSONDecoder().decode([Report].self, from: $0) } ?? []
        MXMetricManager.shared.add(self)
        enqueue(Self.reports(from: MXMetricManager.shared.pastDiagnosticPayloads))
    }

    nonisolated func didReceive(_ payloads: [MXDiagnosticPayload]) {
        let reports = Self.reports(from: payloads)
        Task { @MainActor in self.enqueue(reports) }
    }

    #if DEBUG
    /// Settings › Test: a made-up crash in this app's binary, to check the server and the admin page.
    func sendSample() {
        let stack = #"{"callStackPerThread":true,"callStacks":[{"threadAttributed":true,"callStackRootFrames":[{"binaryName":"DailyClassical","binaryUUID":"00000000-0000-0000-0000-000000000000","offsetIntoBinaryTextSegment":123456,"address":4295091008,"sampleCount":1,"subFrames":[{"binaryName":"SwiftUICore","binaryUUID":"00000000-0000-0000-0000-000000000001","offsetIntoBinaryTextSegment":654321,"address":7000000000,"sampleCount":1}]}]}]}"#
        enqueue([Report(kind: "crash", appVersion: AppVersion.current, build: AppVersion.build, osVersion: "Test", device: "Simulator",
                        at: .now, details: ["exceptionType": "1", "signal": "11", "terminationReason": "Sample report from Settings › Test"],
                        callStack: stack)])
    }
    #endif

    private func enqueue(_ reports: [Report]) {
        guard !reports.isEmpty || !queue.isEmpty else { return }
        queue.append(contentsOf: reports)
        if queue.count > Self.maxQueued { queue.removeFirst(queue.count - Self.maxQueued) }
        save()
        Task { await flush() }
    }

    private func save() {
        try? JSONEncoder().encode(queue).write(to: queueURL, options: .atomic)
    }

    /// One report per request: call stacks can be large.
    private func flush() async {
        guard !sending else { return }
        sending = true
        defer { sending = false }
        while let report = queue.first {
            var body: [String: Any] = [
                "kind": report.kind, "appVersion": report.appVersion, "build": report.build,
                "osVersion": report.osVersion, "device": report.device,
                "at": report.at.formatted(.iso8601), "details": report.details, "test": TestBuild.isActive,
            ]
            if let stack = report.callStack?.data(using: .utf8), let tree = try? JSONSerialization.jsonObject(with: stack) {
                body["callStack"] = tree
            }
            var request = URLRequest(url: APIClient.shared.baseURL.appending(path: "v1/diagnostics"))
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
            request.timeoutInterval = 20
            guard let (_, response) = try? await URLSession.shared.data(for: request),
                  let status = (response as? HTTPURLResponse)?.statusCode,
                  (200..<300).contains(status) || status == 400 || status == 413 else { return }  // offline: keep it
            // Stored, or rejected as malformed or too large (would fail forever): drop it.
            queue.removeFirst()
            save()
        }
    }

    // MARK: Payloads → reports

    nonisolated private static func reports(from payloads: [MXDiagnosticPayload]) -> [Report] {
        payloads.flatMap { payload -> [Report] in
            var out: [Report] = []
            for d in payload.crashDiagnostics ?? [] {
                var details: [String: String] = [:]
                if let v = d.exceptionType { details["exceptionType"] = v.stringValue }
                if let v = d.exceptionCode { details["exceptionCode"] = v.stringValue }
                if let v = d.signal { details["signal"] = v.stringValue }
                if let v = d.terminationReason { details["terminationReason"] = String(v.prefix(500)) }
                out.append(report("crash", d, at: payload.timeStampEnd, details: details, stack: d.callStackTree))
            }
            for d in payload.hangDiagnostics ?? [] {
                out.append(report("hang", d, at: payload.timeStampEnd,
                                  details: ["seconds": String(format: "%.1f", d.hangDuration.converted(to: .seconds).value)],
                                  stack: d.callStackTree))
            }
            for d in payload.cpuExceptionDiagnostics ?? [] {
                out.append(report("cpu", d, at: payload.timeStampEnd,
                                  details: ["cpuSeconds": String(format: "%.0f", d.totalCPUTime.converted(to: .seconds).value),
                                            "sampledSeconds": String(format: "%.0f", d.totalSampledTime.converted(to: .seconds).value)],
                                  stack: d.callStackTree))
            }
            for d in payload.diskWriteExceptionDiagnostics ?? [] {
                out.append(report("disk", d, at: payload.timeStampEnd,
                                  details: ["megabytes": String(format: "%.0f", d.totalWritesCaused.converted(to: .megabytes).value)],
                                  stack: d.callStackTree))
            }
            for d in payload.appLaunchDiagnostics ?? [] {
                out.append(report("launch", d, at: payload.timeStampEnd,
                                  details: ["seconds": String(format: "%.1f", d.launchDuration.converted(to: .seconds).value)],
                                  stack: d.callStackTree))
            }
            return out
        }
    }

    nonisolated private static func report(_ kind: String, _ d: MXDiagnostic, at: Date, details: [String: String], stack: MXCallStackTree) -> Report {
        let json = stack.jsonRepresentation()
        return Report(kind: kind, appVersion: d.applicationVersion, build: d.metaData.applicationBuildVersion,
                      osVersion: d.metaData.osVersion, device: d.metaData.deviceType, at: at, details: details,
                      callStack: json.count <= maxStackBytes ? String(data: json, encoding: .utf8) : nil)
    }
}
