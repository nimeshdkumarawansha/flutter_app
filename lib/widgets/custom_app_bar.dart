import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';

import '../components/color.dart';
import '../pages/profile_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _showFullWidthMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.36,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.3),
            decoration:
                const BoxDecoration(color: Color(0xFF333333)), // kGrayColor
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.person,
                  text: 'My Profile',
                  iconColor: const Color.fromARGB(0, 6, 0, 0),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.home,
                  text: 'Home Page',
                  iconColor: const Color.fromARGB(0, 6, 0, 0),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.login,
                  text: 'Authorized Member Login',
                  iconColor: const Color.fromARGB(0, 6, 0, 0),
                  onTap: () {
                    Navigator.of(context).pop();
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
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
    return AppBar(
      backgroundColor: kBlackColor,
      automaticallyImplyLeading: false, // Disable the back arrow
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
    );
  }
}
