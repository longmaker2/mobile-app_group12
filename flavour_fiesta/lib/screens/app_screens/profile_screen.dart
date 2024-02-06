import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? ThemeData.dark().scaffoldBackgroundColor
          : Colors.white,
      appBar: AppBar(
        leading: null,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isDarkModeEnabled ? Colors.white : Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      'Long Deng',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDarkModeEnabled
                            ? Colors.white
                            : Colors.black, // Text color
                      ),
                    ),
                    Text(
                      'l.deng@alustudent.com',
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

              const SizedBox(height: 32),

              // Menu Items
              buildMenuItem('Home', Icons.home, Icons.chevron_right),
              buildMenuItem('Payment', Icons.payment, Icons.chevron_right),
              buildMenuItem('Dark Mode', Icons.dark_mode, Icons.toggle_on),
              buildMenuItem('Your Orders', Icons.map, Icons.chevron_right),
              buildMenuItem('Settings', Icons.settings, Icons.chevron_right),
              buildMenuItem('Help Center', Icons.help, Icons.chevron_right),

              const SizedBox(height: 32),

              // Logout Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle logout
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
                  foregroundColor: Colors.red, // Button background color
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
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
