import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flavour_fiesta/components/food_categories.dart';
import 'package:flavour_fiesta/components/food_item.dart';
import 'package:flavour_fiesta/components/promotion_card.dart';
import 'package:flavour_fiesta/components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Function to handle when a food category is selected
  void onSelectedFoodCategory(String category) {
    debugPrint(category);
  }

  // Function to handle when a food is searched
  void onSearchedFood(String food) {
    debugPrint(food);
  }

  // Stream to get categories from Firestore
  final Stream<QuerySnapshot> dbcategories =
      FirebaseFirestore.instance.collection('Category').snapshots();

  // Stream to get categories from Firestore
  final Stream<QuerySnapshot> dbfoods =
      FirebaseFirestore.instance.collection('Food ').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 25.0,
                  )
                ],
              ),
              const SizedBox(height: 20),
              // Search bar
              SearchField(
                onSearchedFood: onSearchedFood,
              ),
              const SizedBox(height: 20),
      
              // Food categories (Scrollable horizontally)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Row(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: dbcategories,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child:
                                    CircularProgressIndicator()); // Show loading indicator
                          }
                          if (snapshot.hasError) {
                            return const Center(
                                child: Text(
                                    'Something went wrong')); // Show error message
                          }
                          if (snapshot.data!.docs.isEmpty) {
                            return const Center(
                                child: Text(
                                    'No data found')); // Show message for empty data
                          }
                          // Data is available, display the categories
                          final data = snapshot.requireData;
      
                          return Row(
                            children: data.docs.map((doc) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FoodCategory(
                                  imagePath: doc['imagePath'],
                                  name: doc['name'],
                                  onTap: () {
                                    onSelectedFoodCategory(doc['name']);
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Promotions
              const PromotionCard(),
              const SizedBox(height: 20),
              // Popular items
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: dbfoods,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child:
                                      CircularProgressIndicator()); // Show loading indicator
                            }
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text(
                                      'Something went wrong')); // Show error message
                            }
                            if (snapshot.data!.docs.isEmpty) {
                              return const Center(
                                  child: Text(
                                      'No foods found')); // Show message for empty data
                            }
                            // Data is available, display the categories
                            final data = snapshot.requireData;
      
                            return Row(
                              children: data.docs.map((doc) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: FoodProduct(
                                    name: doc['name'],
                                    imagePath: doc['image'].toString(),
                                    price: 4000,
                                    description: doc['description']
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
