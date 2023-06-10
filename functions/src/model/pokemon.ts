/* eslint-disable require-jsdoc */
export class Pokemon {
  name: string;
  number: string;
  primeNumber: string;
  h: string;
  a: string;
  b: string;
  c: string;
  d: string;
  s: string;
  sum: string;
  type1?: string;
  type2?: string;
  ability1?: string;
  ability2?: string;
  hiddenAbility?: string;

  constructor({
    name,
    number,
    primeNumber,
    h,
    a,
    b,
    c,
    d,
    s,
    sum,
    type1,
    type2,
    ability1,
    ability2,
    hiddenAbility,
  }: {
    name: string;
    number: string;
    primeNumber: string;
    h: string;
    a: string;
    b: string;
    c: string;
    d: string;
    s: string;
    sum: string;
    type1?: string;
    type2?: string;
    ability1?: string;
    ability2?: string;
    hiddenAbility?: string;
  }) {
    this.name = name;
    this.number = number;
    this.primeNumber = primeNumber;
    this.h = h;
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
    this.s = s;
    this.sum = sum;
    this.type1 = type1;
    this.type2 = type2;
    this.ability1 = ability1;
    this.ability2 = ability2;
    this.hiddenAbility = hiddenAbility;
  }

  static fromJson(json: { [key: string]: any }): Pokemon {
    return new Pokemon({
      name: json["name"] || "",
      number: json["number"] || "",
      primeNumber: json["primeNumber"] || "",
      h: json["h"] || "",
      a: json["a"] || "",
      b: json["b"] || "",
      c: json["c"] || "",
      d: json["d"] || "",
      s: json["s"] || "",
      sum: json["sum"] || "",
      type1: json["type1"],
      type2: json["type2"],
      ability1: json["ability1"],
      ability2: json["ability2"],
      hiddenAbility: json["hiddenAbility"],
    });
  }
}
