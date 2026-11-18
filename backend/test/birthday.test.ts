import assert from "node:assert/strict";
import { test } from "node:test";
import { birthdaysOn, celebratedOn } from "../src/lib/birthday.js";

const mozart = { id: "mozart", birthday: "01-27", birthYear: 1756 };
const rossini = { id: "rossini", birthday: "02-29", birthYear: 1792 };
const brahms = { id: "brahms", birthday: "05-07", birthYear: 1833 };
const tchaikovsky = { id: "tchaikovsky", birthday: "05-07", birthYear: 1840 };
const tallis = { id: "tallis", birthday: null, birthYear: null };
const all = [mozart, rossini, brahms, tchaikovsky, tallis];

test("a birthday is found on its day, with the years since birth", () => {
  assert.deepEqual(birthdaysOn("2027-01-27", all).map((c) => [c.id, c.years]), [["mozart", 271]]);
  assert.deepEqual(birthdaysOn("2027-01-28", all), []);
});

test("two composers can share a day", () => {
  assert.deepEqual(birthdaysOn("2027-05-07", all).map((c) => c.id), ["brahms", "tchaikovsky"]);
});

test("29 February is celebrated on 28 February outside leap years", () => {
  assert.equal(celebratedOn("02-29", 2027), "02-28");
  assert.equal(celebratedOn("02-29", 2028), "02-29");
  assert.deepEqual(birthdaysOn("2027-02-28", all).map((c) => c.id), ["rossini"]);
  assert.deepEqual(birthdaysOn("2028-02-28", all), []);
  assert.deepEqual(birthdaysOn("2028-02-29", all).map((c) => c.id), ["rossini"]);
});
