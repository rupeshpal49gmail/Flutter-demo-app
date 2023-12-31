import 'package:flutter/material.dart';
import 'package:collegedoors_demo/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CollegedoorsApp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Splash(),
    );
  }
}
