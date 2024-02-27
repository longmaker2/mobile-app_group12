import 'package:flavour_fiesta/models/food.dart';
import 'package:flavour_fiesta/screens/app_screens/item_view.dart';
import 'package:flutter/material.dart';

class FoodProduct extends StatelessWidget {
  final String name;
  final String imagePath;
  final double price;
  final String description;

  const FoodProduct({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to item view
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ItemView(
                  name: name,
                  imagePath: imagePath,
                  price: price,
                  description:description
                ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 0.0,
          right: 50.0,
        ),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image of the shoe
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imagePath,
                fit: BoxFit.contain,
                width: 150.0,
                height: 150.0,
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
                right: 4.0,
                bottom: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // shoe name
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      // shoe price
                      Text(
                        "Rwf $price",
                        style: TextStyle(
                          color: Colors.yellow[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(0.5),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(26, 119, 237, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),

            // button to add to cart
          ],
        ),
      ),
    );
  }
}
