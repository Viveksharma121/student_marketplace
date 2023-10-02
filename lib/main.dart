import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_marketplace/screens/comps.dart';
import 'package:student_marketplace/screens/departments.dart';
import 'package:student_marketplace/screens/homepage.dart';
import 'package:student_marketplace/screens/login.dart';
import 'package:student_marketplace/screens/signup.dart';
import 'package:student_marketplace/screens/verification.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignUpScreen(),
    );
  }
}
