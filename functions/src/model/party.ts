/* eslint-disable require-jsdoc */
export class Party {
  userId: string;
  partyId: string;
  name: string;
  partyNameList: string[];
  divisorList6: string[];
  divisorList5: string[];
  divisorList4: string[];
  divisorList3: string[];
  divisorList2: string[];
  divisorList1: string[];
  memo: string;
  eachMemo: { [key: string]: string };
  createdAt: Date;

  constructor({
    userId,
    partyId,
    name,
    partyNameList,
    divisorList6,
    divisorList5,
    divisorList4,
    divisorList3,
    divisorList2,
    divisorList1,
    memo,
    eachMemo,
    createdAt,
  }: {
    userId: string;
    partyId: string;
    name: string;
    partyNameList: string[];
    divisorList6: string[];
    divisorList5: string[];
    divisorList4: string[];
    divisorList3: string[];
    divisorList2: string[];
    divisorList1: string[];
    memo: string;
    eachMemo: { [key: string]: string };
    createdAt: Date;
  }) {
    this.userId = userId;
    this.partyId = partyId;
    this.name = name;
    this.partyNameList = partyNameList;
    this.divisorList6 = divisorList6;
    this.divisorList5 = divisorList5;
    this.divisorList4 = divisorList4;
    this.divisorList3 = divisorList3;
    this.divisorList2 = divisorList2;
    this.divisorList1 = divisorList1;
    this.memo = memo;
    this.eachMemo = eachMemo;
    this.createdAt = createdAt;
  }

  static fromJson(json: { [key: string]: any }): Party {
    // Assuming that `createdAt` is a string in ISO 8601 format.
    json["createdAt"] = new Date(json["createdAt"]);
    return new Party({
      userId: json["userId"] || "",
      partyId: json["partyId"] || "",
      name: json["name"] || "",
      partyNameList: json["partyNameList"] || [],
      divisorList6: json["divisorList6"] || [],
      divisorList5: json["divisorList5"] || [],
      divisorList4: json["divisorList4"] || [],
      divisorList3: json["divisorList3"] || [],
      divisorList2: json["divisorList2"] || [],
      divisorList1: json["divisorList1"] || [],
      memo: json["memo"] || "",
      eachMemo: json["eachMemo"] || {},
      createdAt: json["createdAt"] ? new Date(json["createdAt"]) : new Date(),
    });
  }

  static fromDocumentSnapshot(ds: {
    id: string;
    data: () => { [key: string]: any };
  }): Party {
    const data = ds.data();
    data["partyId"] = ds.id;
    return Party.fromJson(data);
  }
}
