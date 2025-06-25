import 'package:flutter/material.dart';
// import 'package:naphalai_e/screens/home/home.dart';
import 'package:naphalai_e/screens/onboarding/onboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: OnboardingPage(), // Replace with your actual onboarding page
    );
  }
}
