import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { getIsEmulator } from "./utils";
import { Battle } from "./model/battle";

admin.initializeApp(functions.config().firebase);

exports.helloWorld = functions
  .region("asia-northeast1")
  .https.onCall((data, context) => {
    const uid = context.auth?.uid;
    console.log(uid);
    console.log(data);
    const result = {
      result: getIsEmulator() ? "Hello World Emulator" : "Hello World",
    };

    return result;
  });

exports.fetchSimilarBattle = functions
  .region("asia-northeast1")
  .https.onCall(async (data, context) => {
    // まずアクセスしてきたユーザidを取得する
    // uidがnullの場合はエラーを返す
    const uid = context.auth?.uid;
    if (!uid) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "The function must be called while authenticated."
      );
    }

    // リクエストパラメータを受け取る
    const divisorList: IDivisorList = data.divisorList;

    // ユーザidをもとにその人のBattle履歴を全て取得する
    const battles = await fetchBattle(uid);
    // console.log("battles", battles);
    // const battleJson = battles.map((battle) => battle.toJson());
    // return battleJson;

    const battlesWithSimilarity = generateBattlesWithSimilarity(
      battles,
      divisorList
    );
    const filteredBattlesWithSimilarity = filterBattlesWithSimilarity(
      battlesWithSimilarity
    );
    const sortedBattlesWithSimilarity = sortBattlesWithSimilarity(
      filteredBattlesWithSimilarity
    );
    return sortedBattlesWithSimilarity.map((battleWithSimilarity) =>
      battleWithSimilarity.battle.toJson()
    );
  });

const fetchBattle = async (uid: string): Promise<Battle[]> => {
  const db = admin.firestore();
  const battlesRef = db.collection("user").doc(uid).collection("battle");
  const snapshot = await battlesRef.get();
  console.log("snapshot", snapshot);
  const battles = snapshot.docs.map((doc) => Battle.fromDocumentSnapshot(doc));
  return battles;
};

interface IDivisorList {
  divisorList1: string[];
  divisorList2: string[];
  divisorList3: string[];
  divisorList4: string[];
  divisorList5: string[];
  divisorList6: string[];
  [key: string]: any;
}

interface BattleWithSimilarity {
  battle: Battle;
  similarity: number;
}
const generateBattlesWithSimilarity = (
  battles: Battle[],
  targetDivisorList: IDivisorList
): BattleWithSimilarity[] => {
  return battles.map((battle) => {
    let similarity = 0;

    for (let i = 6; i >= 1; i--) {
      const listName = `divisorList${i}`;

      if (
        (battle[listName] as string[]).some((value) =>
          targetDivisorList[listName].includes(value)
        )
      ) {
        similarity = i;
        break;
      }
    }

    return {
      battle: battle,
      similarity: similarity,
    };
  });
};

const filterBattlesWithSimilarity = (
  battlesWithSimilarity: BattleWithSimilarity[]
): BattleWithSimilarity[] => {
  return battlesWithSimilarity.filter(
    (battleWithSimilarity) => battleWithSimilarity.similarity > 3
  );
};

const sortBattlesWithSimilarity = (
  battlesWithSimilarity: BattleWithSimilarity[]
): BattleWithSimilarity[] => {
  return battlesWithSimilarity.sort((a, b) => {
    // If similarities are equal, sort by createdAt (most recent first)
    if (a.similarity === b.similarity) {
      return b.battle.createdAt.getTime() - a.battle.createdAt.getTime();
    }
    // Sort by similarity (high to low)
    return b.similarity - a.similarity;
  });
};
