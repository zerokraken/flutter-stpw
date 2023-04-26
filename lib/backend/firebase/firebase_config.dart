import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCSkM7U6GH-wxbiyc2y1CHXSFEQ-ucp1k0",
            authDomain: "intradb-e6773.firebaseapp.com",
            projectId: "intradb-e6773",
            storageBucket: "intradb-e6773.appspot.com",
            messagingSenderId: "1054760619727",
            appId: "1:1054760619727:web:a0d5757d3b2d0d158131ba",
            measurementId: "G-BT2TQ3DZM1"));
  } else {
    await Firebase.initializeApp();
  }
}
