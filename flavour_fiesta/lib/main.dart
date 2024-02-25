import 'package:flutter/material.dart';
import 'screens/onboarding_screens/landing_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          // theme of the application, in this case its the default light
          brightness: Brightness.light,
        ),

        // bottom nav
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.red,
          elevation: 0,
          shape: CircularNotchedRectangle(),
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          //  app bar themes

          displayLarge: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),

          // ···
          titleLarge: GoogleFonts.lato(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: GoogleFonts.inconsolata(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const LandingPage(),
    );
  }
}
