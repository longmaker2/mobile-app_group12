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

  group('LoginPage', () {
    testWidgets('Login page displays UI elements', (WidgetTester tester) async {
      final mockFirebaseAuth = MockFirebaseAuth();

      await tester.pumpWidget(MaterialApp(
        home: LoginPage(
          firebaseAuth: mockFirebaseAuth,
        ),
      ));

      // Verify that Welcome Back text is displayed
      expect(find.text('Welcome Back'), findsOneWidget);

      // Verify that Email and Password fields are displayed
      expect(find.byKey(const Key('email_field')), findsOneWidget);
      expect(find.byKey(const Key('password_field')), findsOneWidget);

      // You can add more tests here to verify other UI elements
    });

    testWidgets('Login with empty email and password shows error dialog',
        (WidgetTester tester) async {
      final mockFirebaseAuth = MockFirebaseAuth();

      await tester.pumpWidget(MaterialApp(
        home: LoginPage(
          firebaseAuth: mockFirebaseAuth,
        ),
      ));

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
  });
}
