import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFF191C),
                  Color(0xFFFC7B8A),
                ],
                stops: [0.0065, 1.0718],
              ),
            ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'images/signup.png',
              ),
            const SizedBox(height: 20),
            const Text(
              'Flavour Fiesta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Let\'s create an account for you now ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: null,
                    filled: true,
                    fillColor: Color(0xFFF3F3F3),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: null,
                    filled: true,
                    fillColor: Color(0xFFF3F3F3),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: null,
                    filled: true,
                    fillColor: Color(0xFFF3F3F3),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.red,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
             Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: GestureDetector(
                      onTap: () {
                        // Handle the sign up action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage()
                          )
                        );
                      },
                      child: Text(
                        'Already have an account? Sign in.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person_add_alt_1,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text('Register'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}