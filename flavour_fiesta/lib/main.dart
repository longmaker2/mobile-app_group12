import 'package:flutter/material.dart';
import 'screens/onboarding_screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
