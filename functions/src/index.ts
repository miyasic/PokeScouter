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
