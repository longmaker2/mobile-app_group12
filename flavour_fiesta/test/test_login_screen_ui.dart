import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flavour_fiesta/screens/auth_screens/login_screen.dart';
import 'package:mockito/mockito.dart';

import 'mock.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Login page displays UI elements', (WidgetTester tester) async {
    final mockFirebaseAuth = MockFirebaseAuth();

    // Build the LoginPage widget
    await tester.pumpWidget(MaterialApp(
        home: LoginPage(
      firebaseAuth: mockFirebaseAuth,
    )));

    // Verify the presence of UI elements
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(
        find.text(
            'We are here to make sure you get the best meal cooked by our expert chefs.'),
        findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Other Sign in Options'), findsOneWidget);
  });

  testWidgets('Login with empty email and password shows error dialog',
      (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(MaterialApp(
        home: LoginPage(
      firebaseAuth: FirebaseAuth.instance,
    )));

    // Find the ElevatedButton widget by its text
    final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Login');

    // Ensure that the ElevatedButton widget is visible
    await tester.ensureVisible(loginButtonFinder);

    // Tap on the Login button
    await tester.tap(loginButtonFinder);
    await tester.pump();

    // Verify that error dialog is displayed
    expect(find.text('All fields are required'), findsOneWidget);
  });
}
