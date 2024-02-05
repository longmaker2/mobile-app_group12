import 'package:flavour_fiesta/screens/app_screens/item_view.dart';
import 'package:flutter/material.dart';

class FoodProduct extends StatelessWidget {
  final String name;
  final String imagePath;
  final double price;

  const FoodProduct({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
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
                ItemView(name: name, imagePath: imagePath, price: price),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 25.0,
          right: 50.0,
        ),
        width: 180.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image of the shoe
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          color: Colors.yellow[600],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(0.5),
                      decoration: const BoxDecoration(
                        color:  Color.fromRGBO(26, 119, 237, 1),
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