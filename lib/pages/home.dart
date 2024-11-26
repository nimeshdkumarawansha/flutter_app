import 'package:flutter/material.dart';
import '../components/color.dart';
import '../widgets/search_bar.dart';
import '../widgets/store_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void _showFullWidthMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *
                0.36, // Adjust height as needed
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height *
                    0.3), // Position below app bar
            decoration: BoxDecoration(color: kGrayColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Close button at the top right
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),

                // Menu Items
                _buildMenuItem(
                  context,
                  icon: Icons.person,
                  text: 'My Profile',
                  iconColor: const Color.fromARGB(0, 255, 255, 255),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add navigation to profile
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.home,
                  text: 'Home Page',
                  iconColor: const Color.fromARGB(0, 255, 255, 255),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add navigation to home
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.login,
                  text: 'Authorized Member Login',
                  iconColor: const Color.fromARGB(0, 255, 255, 255),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add navigation to login
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.power_settings_new,
                  text: 'Logout',
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add logout logic
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper method to create consistent menu items
  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _showFullWidthMenu(context),
                child: Row(
                  children: [
                    const Icon(Icons.menu, color: Colors.white),
                    const SizedBox(width: 8),
                    const Text(
                      "Menu",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/logo/logo.png',
                height: 30,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          CustomSearchBar(),
          StoreList(),
        ],
      ),
    );
  }
}
