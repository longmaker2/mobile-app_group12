import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fiesta/models/providers/has_seen_boarding.dart';
import 'package:flavour_fiesta/models/services/authentication.dart';
import 'package:flavour_fiesta/screens/onboarding_screens/landing_screen.dart';
import 'package:flavour_fiesta/screens/onboarding_screens/signin_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetermineOnBoarding extends ConsumerWidget {
  DetermineOnBoarding({super.key});

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use async/await to wait for the result of getCurrentUser()
    return FutureBuilder<User?>(
      future: _auth.getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Handle the loading state if getCurrentUser() is still executing
          return const CircularProgressIndicator();
        } else {
          // Handle the result of getCurrentUser()
          if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data != null) {
            // User is signed in, check if onboarding is seen or not
            final hasSeenBoarding = ref.watch(hasSeenBoardingProvider);
            debugPrint(hasSeenBoarding.toString());
            if (hasSeenBoarding != true) {
              return const LandingPage();
            } else {
              return const SigninScreen();
            }
          } else {
            // No user is signed in
            return const LandingPage();
          }
        }
      },
    );
  }
}
