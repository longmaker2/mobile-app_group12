import 'package:flutter/material.dart';

class FoodCategory extends StatelessWidget {
  // const FoodCategory({super.key});
  final String imagePath;
  final String name;
  final Function()? onTap;

  const FoodCategory({
    super.key,
    required this.imagePath,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey.shade300,
                elevation: 5,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    imagePath,
                    height: 50.0,
                    width: 50.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
