import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_03/Main Screen.dart';

import 'Splash Screen.dart'; // Ensure this path is correct

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCSi-UkL9Z0jwRzvyyyrk3Bdb-ecRKsScA",
      authDomain: "blend-and-bloom.firebaseapp.com",
      databaseURL: "https://blend-and-bloom-default-rtdb.firebaseio.com",
      projectId: "blend-and-bloom",
      storageBucket: "blend-and-bloom.appspot.com",
      messagingSenderId: "225957636503",
      appId: "1:225957636503:web:63f9c027f84c2d94a67cd2",
      measurementId: "G-LHFHE207YE",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
