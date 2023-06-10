import * as functions from "firebase-functions";
import { getIsEmulator } from "./utils";

exports.helloWorld = functions
  .region("asia-northeast1")
  .https.onCall((data, context) => {
    // your function logic here
    console.log(data);
    const result = {
      result: getIsEmulator() ? "Hello World Emulator" : "Hello World",
    };

    return result;
  });
