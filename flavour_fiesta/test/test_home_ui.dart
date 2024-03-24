import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_fiesta/components/food_categories.dart';
import 'package:flavour_fiesta/components/food_item.dart';
import 'package:flavour_fiesta/components/promotion_card.dart';
import 'package:flavour_fiesta/components/search_bar.dart';
import 'package:flavour_fiesta/screens/app_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart';

void main() {
   // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });
  
  testWidgets('HomeScreen UI Test', (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify the presence of key widgets and their properties

    // Verify the presence of the 'Home' text
    expect(find.text('Home'), findsOneWidget);

    // Verify the presence of the SearchField widget
    expect(find.byType(SearchField), findsOneWidget);

    // Verify the presence of the Food categories
    await tester.pumpAndSettle(); // Wait for the categories to load
    expect(find.byType(FoodCategory), findsWidgets);

    // Verify the presence of the PromotionCard widget
    expect(find.byType(PromotionCard), findsOneWidget);

    // Verify the presence of the 'Popular' text
    expect(find.text('Popular'), findsOneWidget);

    // Verify the presence of the FoodProduct widgets
    await tester.pumpAndSettle(); // Wait for the products to load
    expect(find.byType(FoodProduct), findsWidgets);
  });
}
