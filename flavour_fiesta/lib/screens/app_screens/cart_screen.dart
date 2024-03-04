// ignore_for_file: prefer_const_constructors

import 'package:flavour_fiesta/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';














class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _instructionsController = TextEditingController();

  void _deteleItemInCart(String id) async {
    await FirebaseFirestore.instance.collection('Orders').doc(id).delete();

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Item deleted successfully',
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.red,
    ));
  }

  // Function to add the item to the cart
  void _placeorder(BuildContext context) async {
    try {
      // A reference to the Firestore instance
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Saves data to the Firestore
      final Map<String, dynamic> orderData = {};

      // Adds the order to a collection named "Orders"
      await firestore.collection('ConfirmedOrders').add(orderData);

      // Delay showing the SnackBar to avoid interference with the "Close" button
      await Future.delayed(Duration(milliseconds: 500));

      // Show a success message using a SnackBar
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Your order has been placed successfully!',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 4),
          backgroundColor: Colors.green,
        ),
      );

      debugPrint("Order added to Firestore successfully!");
    } catch (error) {
      // Handle any errors that occur during the process
      debugPrint("Error adding order to Firestore: $error");
    }
  }

  // Stream to get categories from Firestore
  final Stream<QuerySnapshot> userorders =
      FirebaseFirestore.instance.collection('Orders').snapshots();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Items in cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40.0),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: userorders,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Show loading indicator
                  }
                  if (snapshot.hasError) {
                    return const Center(
                        child:
                            Text('Something went wrong')); // Show error message
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text(
                            'No data found')); // Show message for empty data
                  }
                  // Data is available, display the categories
                  final data = snapshot.requireData;

                  // try with the list builder

                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      var doc = data.docs[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CartItem(
                              itemName: doc['name'],
                              itemPrice: doc['price'],
                              itemImage: doc['imagePath'],
                              quantity: doc['quantity'],
                              onTap: () {
                                _deteleItemInCart(doc.id);
                              }),
                        ),
                      );
                    },
                  );

                  // return Row(
                  //   children: data.docs.map((doc) {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(right: 8.0),
                  //       child: CartItem(
                  //         itemName: doc['name'],
                  //         itemPrice: doc['price'],
                  //         itemImage:doc['imagePath'],
                  //         quantity: doc['quantity'],
                  //       ),
                  //     );
                  //   }).toList(),
                  // );
                },
              ),

              // child: ListView.builder(
              //   itemCount: 5,
              //   itemBuilder: (context, index) {
              //     return const CartItem(
              //       itemName: 'Coke',
              //       itemPrice: 100,
              //       itemImage: 'images/can.jpg',
              //     );
              //   },
              // ),
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
            const SizedBox(height: 20.0),
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 0.1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
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
                    color: Colors.yellow.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
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
                  ),
                ),
                onPressed: (){

                },
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
    );
  }
}
