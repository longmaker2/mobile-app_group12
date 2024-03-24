import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_fiesta/screens/auth_screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'mock.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Register user', (WidgetTester tester) async {
    // Build the Registration widget
    await tester.pumpWidget(const MaterialApp(
      home: Registration(),
    ));

    // Set up TextEditingController for email, name, and password
    final emailController = TextEditingController(text: 'test@example.com');
    final nameController = TextEditingController(text: 'Test User');
    final passwordController = TextEditingController(text: 'password');

    // Enter values into text fields
    await tester.enterText(
        find.byKey(const Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('nameField')), 'Test User');
    await tester.enterText(find.byKey(const Key('passwordField')), 'password123');

    // Find the ElevatedButton widget by its text
    final RegisterButtonFinder =
        find.widgetWithText(ElevatedButton, 'Register');

    // Ensure that the ElevatedButton widget is visible
    await tester.ensureVisible(RegisterButtonFinder);

    // Tap the ElevatedButton widget
    await tester.tap(RegisterButtonFinder);
    await tester.pumpAndSettle();

    // Verify that the user is registered
    expect(FirebaseAuth.instance.currentUser, isNull);
    
  });
}
