/**
 * Groups MetricKit reports of the same fault (routes/diagnostics.ts): the kind, for crashes the
 * signal, and the first frame in the app's own binary (else the top frame), as binary+offset.
 */
const APP_BINARIES = new Set(["DailyClassical", "DailyClassical.debug.dylib", "DailyClassicalWidget"]);

type Frame = { binaryName?: string; offsetIntoBinaryTextSegment?: number; sampleCount?: number; subFrames?: Frame[] };
type Tree = { callStackPerThread?: boolean; callStacks?: { threadAttributed?: boolean; callStackRootFrames?: Frame[] }[] };

const SIGNALS: Record<string, string> = { "4": "SIGILL", "5": "SIGTRAP", "6": "SIGABRT", "7": "SIGEMT", "8": "SIGFPE", "9": "SIGKILL", "10": "SIGBUS", "11": "SIGSEGV", "13": "SIGPIPE" };

/** The frames of the crashed (or busiest) thread, innermost first. */
function framesOf(tree: Tree): Frame[] {
  const stacks = tree.callStacks ?? [];
  const stack = stacks.find((s) => s.threadAttributed) ?? stacks[0];
  const pick = (frames: Frame[] | undefined) =>
    frames?.length ? frames.reduce((a, b) => ((b.sampleCount ?? 0) > (a.sampleCount ?? 0) ? b : a)) : undefined;
  const out: Frame[] = [];
  let frame = pick(stack?.callStackRootFrames);
  while (frame && out.length < 200) {
    out.push(frame);
    frame = pick(frame.subFrames);
  }
  return out;
}

const frameLabel = (f: Frame) => `${f.binaryName ?? "?"}+0x${(f.offsetIntoBinaryTextSegment ?? 0).toString(16)}`;

export function signatureOf(kind: string, details: Record<string, string>, tree: unknown): string {
  const frames = tree && typeof tree === "object" ? framesOf(tree as Tree) : [];
  const own = frames.find((f) => f.binaryName && APP_BINARIES.has(f.binaryName));
  const where = own ? frameLabel(own) : frames[0] ? frameLabel(frames[0]) : "no stack";
  const signal = kind === "crash" && details.signal ? ` ${SIGNALS[details.signal] ?? `signal ${details.signal}`}` : "";
  return `${kind}${signal} · ${where}`;
}
