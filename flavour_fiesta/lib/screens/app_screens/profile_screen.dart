import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavour_fiesta/models/services/authentication.dart';
import 'package:flavour_fiesta/screens/onboarding_screens/signin_register_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkModeEnabled = false;
  FirebaseAuthServices _authservices = FirebaseAuthServices();
  User? _currentUser;

  // get the current user
  var getUserDetials;

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
    // Fetch user details from Firestore
    getUserDetails(user!.email ?? '');
  }

  // get the user details
  Future<void> getUserDetails(String email) async {
    // Fetch user details from Firestore
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('users')
        .doc(email)
        .get(); // Get user details from Firestore
    if (snapshot.exists) {
      setState(() {
        // Update state with user details
        getUserDetials = snapshot.data();
      });
    }
    print(getUserDetials);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 38.0,
          vertical: MediaQuery.of(context).size.height * 0.15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('images/profile_picture.jpg'),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 1,
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                Icons.edit,
                                color: isDarkModeEnabled
                                    ? Colors.white
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Name and Email
                  Text(
                    _currentUser?.displayName ?? 'Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkModeEnabled
                          ? Colors.white
                          : Colors.black, // Text color
                    ),
                  ),
                  Text(
                    _currentUser?.email ?? 'user@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkModeEnabled
                          ? Colors.white
                          : Colors.grey, // Text color
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Menu Items
            buildMenuItem('Home', Icons.home, Icons.chevron_right),
            buildMenuItem('Payment', Icons.payment, Icons.chevron_right),
            buildMenuItem('Dark Mode', Icons.dark_mode, Icons.toggle_on),
            buildMenuItem('Your Orders', Icons.map, Icons.chevron_right),
            buildMenuItem('Settings', Icons.settings, Icons.chevron_right),
            buildMenuItem('Help Center', Icons.help, Icons.chevron_right),

            const SizedBox(height: 20),

            // Logout Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle logout
                _authservices.SignOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SigninScreen()),
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white, // Icon color
              ),
              label: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      String title, IconData leadingIcon, IconData trailingIcon) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                leadingIcon,
                color: isDarkModeEnabled ? Colors.white : Colors.black,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: isDarkModeEnabled ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          Icon(
            trailingIcon == Icons.toggle_on
                ? isDarkModeEnabled
                    ? Icons.toggle_on
                    : Icons.toggle_off
                : trailingIcon,
            color: trailingIcon == Icons.toggle_on
                ? Colors.black
                : isDarkModeEnabled
                    ? Colors.white
                    : Colors.black,
            size: trailingIcon == Icons.toggle_on ? 50 : null,
          ),
        ],
      ),
      onTap: () {
        if (title == 'Dark Mode') {
          setState(() {
            isDarkModeEnabled = !isDarkModeEnabled;
          });
        } else {
          // Handle menu item tap
        }
      },
    );
  }
}
