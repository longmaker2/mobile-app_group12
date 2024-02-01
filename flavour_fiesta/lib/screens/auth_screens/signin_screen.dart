import 'package:flutter/material.dart';

void main() {
  runApp(const SignInPage());
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flavour Fiesta',
      home: FlavorFiesta(),
    );
  }
}

class FlavorFiesta extends StatelessWidget {
  const FlavorFiesta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent, // Replace with the exact color code
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(flex: 2), // Adjust the flex to manage the space
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/spaghetti.png', // Replace with your asset image path
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Flavour Fiesta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Order your favorite Meals Here!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Spacer(), // Adjust the flex to manage the space
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  backgroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text('Sign in'),
              ),
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white), // Border color
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const Text('Register'),
              ),
            ),
            const Spacer(), // Adjust the flex to manage the space
          ],
        ),
      ),
    );
  }
}
