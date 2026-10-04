import Foundation

/// Last good API response per (language, endpoint), kept in Caches so Today and
/// recently opened pieces still open without a connection.
actor ResponseCache {
    private let directory: URL

    init(directory: URL = URL.cachesDirectory.appending(path: "api", directoryHint: .isDirectory)) {
        self.directory = directory
        try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
    }

    private func url(for key: String) -> URL {
        directory.appending(path: key.replacingOccurrences(of: "/", with: "_") + ".json")
    }

    func store(_ data: Data, for key: String) {
        try? data.write(to: url(for: key), options: .atomic)
    }

    func data(for key: String) -> Data? {
        try? Data(contentsOf: url(for: key))
    }
}
