import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_fiesta/screens/auth_screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flavour_fiesta/screens/auth_screens/login_screen.dart';
import 'package:mockito/mockito.dart';
import 'mock.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}


void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Registration page displays UI elements', (WidgetTester tester) async {
    // Build the RegistrationPage widget
    await tester.pumpWidget(const MaterialApp(
      home: Registration(),
    ));

    // Verify the presence of UI elements
    expect(find.text('Flavour Fiesta'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Already have an account? Sign in.'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Other Sign in Options'), findsOneWidget);
  });

}