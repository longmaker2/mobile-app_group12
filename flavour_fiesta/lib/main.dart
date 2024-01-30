// main.dart

import 'package:flutter/material.dart';
import 'screens/onboarding_screens/landing_screen.dart'; // Adjust the import based on your project structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlavourFiesta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
    );
  }
}
