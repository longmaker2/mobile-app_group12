import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fiesta/models/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flavour_fiesta/components/add_on.dart';
import 'package:flavour_fiesta/components/add_to_cart_button.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class ItemView extends StatefulWidget {
  final String name;
  final String imagePath;
  final double price;
  final String description;

  const ItemView({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  FirebaseAuthServices _authservices = FirebaseAuthServices();
  User? _currentUser;
  int _countNumber = 1;

  @override
  void initState() {
    super.initState();
    getCurrentUser(); // Call method to get current user when the screen initializes
  }

  Future<void> getCurrentUser() async {
    User? user = await _authservices.getCurrentUser(); // Get current user
    setState(() {
      _currentUser = user; // Update state with current user
    });
  }

  void _increment() {
    setState(() {
      _countNumber++;
    });
  }

  void _decrement() {
    setState(() {
      if (_countNumber > 1) {
        _countNumber--;
      }
    });
  }

  // Function to add the item to the cart
  void addUserItemToCard(BuildContext context) async {
    try {
      // A reference to the Firestore instance
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Saves data to the Firestore
      final Map<String, dynamic> orderData = {
        'id': const Uuid().v4(),
        'user': _currentUser!.email,
        'name': widget.name,
        'imagePath': widget.imagePath,
        'price': widget.price * _countNumber,
        'quantity': _countNumber,
      };

      // Adds the order to a collection named "Orders"
      await firestore.collection('Orders').add(orderData);

      // Delay showing the SnackBar to avoid interference with the "Close" button
      await Future.delayed(const Duration(milliseconds: 500));

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

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } catch (error) {
      // Handle any errors that occur during the process
      debugPrint("Error adding order to Firestore: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.imagePath,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(3.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18.0,
                          right: 28.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.0,
                              width: 80.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16.0,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Rwf ${widget.price * _countNumber}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18.0,
                          right: 2.0,
                        ),
                        child: Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1, // Limiting to one line
                                overflow:
                                    TextOverflow.ellipsis, // Handling overflow
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: _decrement,
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        const CircleBorder(
                                          side: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                      size: 16.0,
                                    ),
                                  ),
                                  Text(
                                    '$_countNumber',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: _increment,
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        const CircleBorder(
                                          side: BorderSide(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.red,
                                      size: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 30.0,
                        ),
                        child: Text(
                          widget.description,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                          maxLines: 3, // Limiting to three lines
                          overflow: TextOverflow.ellipsis, // Handling overflow
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 18.0,
                          right: 2.0,
                          top: 18.0,
                          bottom: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add Ons",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 0.0,
                          right: 0.0,
                          top: 18.0,
                          bottom: 10.0,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AddOn(),
                              AddOn(),
                              AddOn(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 60.0,
                          right: 40.0,
                          top: 20.0,
                          bottom: 10.0,
                        ),
                        child: AddToCart(
                          onTap: () => addUserItemToCard(context),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
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
