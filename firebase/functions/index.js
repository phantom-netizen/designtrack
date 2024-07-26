const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("users/" + user.uid);
  await firestore.collection("users").doc(user.uid).delete();
  await firestore
    .collection("userDetails")
    .where("email", "==", user.uid)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection userDetails`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("projects")
    .where("owner", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection projects`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("tasks")
    .where("owner", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection tasks`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("files")
    .where("user_ref", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection files`);
        await doc.ref.delete();
      }
    });
});
