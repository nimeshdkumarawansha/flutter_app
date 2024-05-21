import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final press = await SharedPreferences.getInstance();
            press.setBool("onBoarding", false);
          },
          child: const Text("Enable Onboarding"),
        ),
      ),
    );
  }
}
