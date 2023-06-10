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

    // ユーザidをもとにその人のBattle履歴を全て取得する
    const battles = await fetchBattle(uid);
    console.log("battles", battles);
    const json = JSON.stringify(battles.map((battle) => battle.toJson()));
    return json;
  });

const fetchBattle = async (uid: string): Promise<Battle[]> => {
  const db = admin.firestore();
  const battlesRef = db.collection("user").doc(uid).collection("battle");
  const snapshot = await battlesRef.get();
  console.log("snapshot", snapshot);
  const battles = snapshot.docs.map((doc) => Battle.fromDocumentSnapshot(doc));
  return battles;
};
