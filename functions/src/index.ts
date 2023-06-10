import * as functions from "firebase-functions";

exports.helloWorld = functions
  .region("us-central1")
  .https.onCall((data, context) => {
    // your function logic here
    return {
      result: "Hello World Emulator!",
    };
  });
