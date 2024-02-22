// ignore_for_file: prefer_const_constructors

import 'package:flavour_fiesta/components/cart_item.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _intsrtuctionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '2 Items in cart',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 40.0),
                const CartItem(
                  itemName: 'Coke',
                  itemPrice: 1000.0,
                  itemImage: 'images/can.jpg',
                ),
                const SizedBox(height: 20),
                const CartItem(
                  itemName: 'Chicken Briyani',
                  itemPrice: 2000.0,
                  itemImage: 'images/rice.png',
                ),
                const SizedBox(height: 20),
                const CartItem(
                  itemName: 'bottled Coke ',
                  itemPrice: 2000.0,
                  itemImage: 'images/coke.jpg',
                ),

                const SizedBox(height: 20),

                // other instructions
                const Text(
                  'Other Instructions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextField(
                    controller: _intsrtuctionsController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 0.1,
                        ),
                      ),
                    )),
                const SizedBox(height: 20),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Rwf 2000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    onPressed: () {},
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 9.0),
                        child: Text(
                          'Place Order',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
