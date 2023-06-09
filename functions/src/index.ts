import * as functions from "firebase-functions";

exports.helloWorld = functions.https.onCall((data, context) => {
  // your function logic here
  return {
    result: "Hello World",
  };
});
