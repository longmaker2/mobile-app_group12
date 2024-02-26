import 'package:flavour_fiesta/components/food_categories.dart';
import 'package:flavour_fiesta/components/food_item.dart';
import 'package:flavour_fiesta/components/promotion_card.dart';
import 'package:flavour_fiesta/components/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  tap function to know which food category is tapped
  void onSelectedFoodCategory(String category) {
    debugPrint(category);
  }

  // get the searched for food
  void onSearchedFood(String food) {
    debugPrint(food);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
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
                ]),
            const SizedBox(
              height: 20,
            ),
            // search bar
            SearchField(
              onSearchedFood: onSearchedFood,
            ),

            const SizedBox(
              height: 20,
            ),

            // show the food categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Row(
                  children: [
                    FoodCategory(
                        imagePath: 'images/rice.png',
                        name: 'Pizza',
                        onTap: () {
                          onSelectedFoodCategory('Pizza');
                        }),
                    FoodCategory(
                        imagePath: 'images/rice.png',
                        name: 'Burger',
                        onTap: () {
                          onSelectedFoodCategory('Burger');
                        }),
                    FoodCategory(
                        imagePath: 'images/rice.png',
                        name: 'Ice Cream',
                        onTap: () {
                          onSelectedFoodCategory('Ice Cream');
                        }),
                    FoodCategory(
                        imagePath: 'images/rice.png',
                        name: 'Beer',
                        onTap: () {
                          onSelectedFoodCategory('Beer');
                        }),
                    FoodCategory(
                        imagePath: 'images/rice.png',
                        name: 'Cocktail',
                        onTap: () {
                          onSelectedFoodCategory('Cocktail');
                        }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // promotions
            const PromotionCard(),
            const SizedBox(
              height: 20,
            ),

            // popular
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FoodProduct(
                        name: 'Full chicken',
                        imagePath: 'images/rice.png',
                        price: 10000,
                      ),
                      FoodProduct(
                        name: 'Full chicken',
                        imagePath: 'images/rice.png',
                        price: 10000,
                      ),
                      FoodProduct(
                        name: 'Full chicken',
                        imagePath: 'images/rice.png',
                        price: 10000,
                      ),
                      FoodProduct(
                        name: 'Full chicken',
                        imagePath: 'images/rice.png',
                        price: 10000,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
