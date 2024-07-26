import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCSUDuhTCa3pExxznPjIGiafUsm94upo-0",
            authDomain: "designtrack-38293.firebaseapp.com",
            projectId: "designtrack-38293",
            storageBucket: "designtrack-38293.appspot.com",
            messagingSenderId: "626551659343",
            appId: "1:626551659343:web:0ef81e03bcf92447d9433a",
            measurementId: "G-S74PRRDTXV"));
  } else {
    await Firebase.initializeApp();
  }
}
