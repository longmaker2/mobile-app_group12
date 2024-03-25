import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_fiesta/screens/app_screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  testWidgets('cart screen ...', (WidgetTester tester) async {
    // TODO: Implement test
    await tester.pumpWidget(const MaterialApp(
      home: CartScreen(),
    ));
    expect(find.text('Other Instructions'), findsOneWidget);
    expect(find.text('Items in cart'), findsOneWidget);
    expect(find.text('Something went wrong'), findsOneWidget);
    expect(find.text('No data found'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.byType(Padding), findsNWidgets(11));
    await tester.pumpAndSettle();
  });
}
