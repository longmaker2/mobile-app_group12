import 'package:flavour_fiesta/components/food_categories.dart';
import 'package:flavour_fiesta/components/food_item.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        centerTitle: false,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 40.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpeg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search bar
            const SearchField(),
            const SizedBox(
              height: 16,
            ),

            // show the food categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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

            // promotions
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                top: 20.0,
                right: 25.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Promotions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Today\'s Offer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(
                                  'Free Soda',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 1.0,
                                ),
                                child: Text(
                                  'on all orders above RWF',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 80.0),
                                child: Text(
                                  '15,000 ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Image(
                            image: AssetImage('images/rice.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // popular
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
