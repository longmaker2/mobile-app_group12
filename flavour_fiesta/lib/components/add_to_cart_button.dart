import 'package:flutter/material.dart';


class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.0, vertical: 18.0),
        child: Center(
          child: Text(
            'Add to Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      )
    );
  }
}
