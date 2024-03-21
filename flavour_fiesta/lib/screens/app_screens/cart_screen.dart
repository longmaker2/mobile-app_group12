// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fiesta/components/cart_item.dart';
import 'package:flavour_fiesta/models/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _instructionsController = TextEditingController();
  FirebaseAuthServices _authservices = FirebaseAuthServices();
  User? _currentUser;
  late Stream<QuerySnapshot>
      userorders; // Declare userorders as a late variable

  @override
  void initState() {
    super.initState();
    getCurrentUser(); // Call method to get current user when the screen initializes
  }

  Future<void> getCurrentUser() async {
    User? user = await _authservices.getCurrentUser(); // Get current user
    setState(() {
      _currentUser = user; // Update state with current user

      // Initialize userorders stream inside getCurrentUser
      userorders = FirebaseFirestore.instance
          .collection('Orders')
          .where('user', isEqualTo: _currentUser!.email)
          .snapshots();
    });
  }

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

      // Retrieve the user's orders
      QuerySnapshot ordersSnapshot = await firestore
          .collection('Orders')
          .where('user', isEqualTo: _currentUser!.email)
          .get();

      // For each order in the user's orders, move it to ConfirmedOrders
      for (QueryDocumentSnapshot order in ordersSnapshot.docs) {
        // Cast order data to Map<String, dynamic> explicitly
        Map<String, dynamic> orderData = order.data() as Map<String, dynamic>;

        await firestore.collection('ConfirmedOrders').add({
          'id': Uuid().v4(),
          'order': orderData,
          'user': _currentUser!.email,
          'instructions': _instructionsController.text,
          'time': Timestamp.now(),
        }); // Add order to ConfirmedOrders
        await firestore
            .collection('Orders')
            .doc(order.id)
            .delete(); // Delete order from Orders
      }

      setState(() {
        _instructionsController.clear();
      });

      // Show a success message using a SnackBar
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

      debugPrint("Orders moved to ConfirmedOrders successfully!");
    } catch (error) {
      // Handle any errors that occur during the process
      debugPrint("Error placing order: $error");
    }
  }

  // // Stream to get categories from Firestore
  // final Stream<QuerySnapshot> userorders =
  //     FirebaseFirestore.instance.collection('Orders').where('user', isEqualTo: _currentUser!.email).snapshots();

  @override
  Widget build(BuildContext context) {
    return _currentUser != null
        ? (SizedBox(
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

                        // try with the list builder

                        return ListView.builder(
                          itemCount: data.docs.length,
                          itemBuilder: (context, index) {
                            var doc = data.docs[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                      },
                    ),
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
                      onPressed: () => _placeorder(context),
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
          ))
        : (Center(
            child: CircularProgressIndicator(),
          ));
  }
}
