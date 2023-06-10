/* eslint-disable require-jsdoc */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-explicit-any */
class Battle {
  userId: string;
  battleId: string;
  partyId: string;
  opponentParty: string[];
  myParty: string[];
  divisorList6: string[];
  divisorList5: string[];
  divisorList4: string[];
  divisorList3: string[];
  divisorList2: string[];
  divisorList1: string[];
  opponentOrder: number[];
  myOrder: number[];
  memo: string;
  eachMemo: { [key: string]: string };
  result: string;
  createdAt: Date;

  constructor({
    userId,
    battleId,
    partyId,
    opponentParty,
    myParty,
    divisorList6,
    divisorList5,
    divisorList4,
    divisorList3,
    divisorList2,
    divisorList1,
    opponentOrder,
    myOrder,
    memo,
    eachMemo,
    result,
    createdAt,
  }: {
    userId: string;
    battleId: string;
    partyId: string;
    opponentParty: string[];
    myParty: string[];
    divisorList6: string[];
    divisorList5: string[];
    divisorList4: string[];
    divisorList3: string[];
    divisorList2: string[];
    divisorList1: string[];
    opponentOrder: number[];
    myOrder: number[];
    memo: string;
    eachMemo: { [key: string]: string };
    result: string;
    createdAt: Date;
  }) {
    this.userId = userId;
    this.battleId = battleId;
    this.partyId = partyId;
    this.opponentParty = opponentParty;
    this.myParty = myParty;
    this.divisorList6 = divisorList6;
    this.divisorList5 = divisorList5;
    this.divisorList4 = divisorList4;
    this.divisorList3 = divisorList3;
    this.divisorList2 = divisorList2;
    this.divisorList1 = divisorList1;
    this.opponentOrder = opponentOrder;
    this.myOrder = myOrder;
    this.memo = memo;
    this.eachMemo = eachMemo;
    this.result = result;
    this.createdAt = createdAt;
  }

  static fromJson(json: { [key: string]: any }): Battle {
    // Assuming that `createdAt` is a string in ISO 8601 format.
    json["createdAt"] = new Date(json["createdAt"]);
    return new Battle({
      userId: json["userId"] || "",
      battleId: json["battleId"] || "",
      partyId: json["partyId"] || "",
      opponentParty: json["opponentParty"] || [],
      myParty: json["myParty"] || [],
      divisorList6: json["divisorList6"] || [],
      divisorList5: json["divisorList5"] || [],
      divisorList4: json["divisorList4"] || [],
      divisorList3: json["divisorList3"] || [],
      divisorList2: json["divisorList2"] || [],
      divisorList1: json["divisorList1"] || [],
      opponentOrder: json["opponentOrder"] || [],
      myOrder: json["myOrder"] || [],
      memo: json["memo"] || "",
      eachMemo: json["eachMemo"] || {},
      result: json["result"] || "",
      createdAt: json["createdAt"] ? new Date(json["createdAt"]) : new Date(),
    });
  }

  static fromDocumentSnapshot(ds: {
    id: string;
    data: () => { [key: string]: any };
  }): Battle {
    const data = ds.data();
    data["battleId"] = ds.id;
    return Battle.fromJson(data);
  }
}
