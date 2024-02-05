import 'package:flavour_fiesta/screens/app_screens/home_entry.dart';
import 'package:flutter/material.dart';
import 'register.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Container(
              decoration: const BoxDecoration(
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
            ),
          const Positioned(
            left: 50,
            top: 100,
            child: Ellipse(size: 20),
          ),
          const Positioned(
            right: 80,
            top: 180,
            child: Ellipse(size: 15),
          ),
          const Positioned(
            left: 150,
            bottom: 80,
            child: Ellipse(size: 25),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/login.png'),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: Text(
                  'We are here to make sure you get the best meal cooked by our expert chefs.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
             const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
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
                      Icons.mail_outline,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    border: null,
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: GestureDetector(
                      onTap: () {
                        // Handle the sign up action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>const Registration(),
                          )
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeEntry()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text('Login'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Ellipse extends StatelessWidget {
  final double size;

  const Ellipse({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.3),
      ),
    );
  }
}
