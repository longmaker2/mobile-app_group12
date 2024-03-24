import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_fiesta/screens/onboarding_screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flavour_fiesta/screens/onboarding_screens/signin_register_screen.dart';

import 'mock.dart';

void main() {
   // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  testWidgets('LandingPage widget test', (WidgetTester tester) async {
    // Build the LandingPage widget
    await tester.pumpWidget(const MaterialApp(
      home: LandingPage(),
    ));

    // Verify the presence of widgets and their properties
    expect(find.text('Finger Licking Good!'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);

    // Tap the Get Started button and verify the navigation
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    expect(find.byType(SigninScreen), findsOneWidget);
  });
}
