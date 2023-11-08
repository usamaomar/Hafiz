import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCNdbKltBXURyIh2W-3Rws1ydbGxSuWZPs",
            authDomain: "hafiz-f7d0c.firebaseapp.com",
            projectId: "hafiz-f7d0c",
            storageBucket: "hafiz-f7d0c.appspot.com",
            messagingSenderId: "491123002628",
            appId: "1:491123002628:web:978fc171b7e2d64c0b1451",
            measurementId: "G-VB6QRK9PNH"));
  } else {
    await Firebase.initializeApp();
  }
}
