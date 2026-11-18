/**
 * Composer birthdays (content/composers.yaml `birthday: "MM-DD"`). The app celebrates on that day;
 * a 29 February birthday (Rossini) falls on 28 February in other years. The iOS app has the same
 * rule (Core/Services/Birthdays.swift); keep them in step.
 */

const isLeap = (y: number) => (y % 4 === 0 && y % 100 !== 0) || y % 400 === 0;

/** The "MM-DD" a stored birthday is celebrated on in `year`. */
export function celebratedOn(birthday: string, year: number): string {
  return birthday === "02-29" && !isLeap(year) ? "02-28" : birthday;
}

/** Composers celebrated on `day` ("YYYY-MM-DD"), with how many years since their birth year. */
export function birthdaysOn<C extends { birthday: string | null; birthYear: number | null }>(day: string, composers: C[]) {
  const year = Number(day.slice(0, 4));
  const md = day.slice(5);
  return composers
    .filter((c) => c.birthday && celebratedOn(c.birthday, year) === md)
    .map((c) => ({ ...c, years: c.birthYear ? year - c.birthYear : null }));
}
