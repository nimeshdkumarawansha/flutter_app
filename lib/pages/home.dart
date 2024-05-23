import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Auth/register.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            // final press = await SharedPreferences.getInstance();
            // press.setBool("onBoarding", false);

             Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ));
          },
          child: const Text("Register Page"),
        ),
      ),
    );
  }
}
