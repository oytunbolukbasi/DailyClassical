import { readFileSync } from "node:fs";
import { parse as parseYaml } from "yaml";

export interface Schedule {
  start: string;
  days: number;
  order: string[];
}

export function loadSchedule(path: string): Schedule {
  const s = parseYaml(readFileSync(path, "utf8")) as { start: string | Date; days: number; order: string[] };
  const start = s.start instanceof Date ? s.start.toISOString().slice(0, 10) : String(s.start);
  return { start, days: s.days, order: s.order };
}

/** [{ day: "2026-10-04", pieceId }, …] for `days` days from `start`. */
export function expandSchedule(s: Schedule): { day: string; pieceId: string }[] {
  const t0 = Date.parse(`${s.start}T00:00:00Z`);
  return Array.from({ length: s.days }, (_, i) => ({
    day: new Date(t0 + i * 86_400_000).toISOString().slice(0, 10),
    pieceId: s.order[i % s.order.length]!,
  }));
}
