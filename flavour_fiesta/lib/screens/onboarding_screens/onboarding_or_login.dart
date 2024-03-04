import 'package:flavour_fiesta/models/providers/has_seen_boarding.dart';
import 'package:flavour_fiesta/screens/onboarding_screens/landing_screen.dart';
import 'package:flavour_fiesta/screens/onboarding_screens/signin_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetermineOnBoarding extends ConsumerWidget {
  const DetermineOnBoarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSeenBoarding = ref.watch(hasSeenBoardingProvider);
    if (hasSeenBoarding) {
      return const LandingPage();
    } else {
      return const SigninScreen();
    }
  }
}
