import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB77orcio17JT4EHpP_bQmqppRMwOR9zQU",
            authDomain: "atc-medscan2.firebaseapp.com",
            projectId: "atc-medscan2",
            storageBucket: "atc-medscan2.appspot.com",
            messagingSenderId: "546984360348",
            appId: "1:546984360348:web:8cf5d5445514b453dc7059"));
  } else {
    await Firebase.initializeApp();
  }
}
