import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/api_calls.dart';
import 'package:flutter_app/components/color.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/components/squre_tile.dart';
import 'package:flutter_app/pages/Auth/register.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/alerts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(backgroundColor: Colors.red),
        );
      },
    );

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String deviceName = Platform.isAndroid ? "android" : "ios";

    try {
      // Make POST request to login API
      final response = await ApiCalls.login(
        email: email,
        password: password,
        deviceName: deviceName,
      );

      if (!mounted) return;

      // Handle response based on status code
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', data['token']);
        await prefs.setBool('isLoggedIn', true);

        // Close the loading dialog
        Navigator.pop(context);

        // Navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            settings: const RouteSettings(name: '/home'),
            builder: (context) {
              return const Home();
            },
          ),
        );
      } else if (response.statusCode == 422) {
        // Close the loading dialog
        Navigator.pop(context);
        
        var message = json.decode(response.body)['message'];
        Alerts.showMessage(context, message);
      } else {
        // Close the loading dialog
        Navigator.pop(context);
        
        Alerts.showMessage(context, "Login failed");
      }
    } catch (e) {
      // Close the loading dialog in case of error
      Navigator.pop(context);
      showErrorMessage("An error occurred. Please try again.");
    }
  }

  // Error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrayColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // logo
              SizedBox(
                height: 100,
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(height: 50),
              // welcome back, you've been missed!
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'SIGNIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // email text field
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              // password text field
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              // forgot Password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // sign in button
              MyButton(onTap: signUserIn, text: "Sign In"),
              const SizedBox(height: 50),
              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Continue with',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // google + apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SqureTile(onTap: () {}, imagePath: 'assets/google.png'),
                  const SizedBox(width: 25),
                  // facebook button
                  SqureTile(onTap: () {}, imagePath: 'assets/facebook.png'),
                  const SizedBox(width: 25),
                  // apple Button
                  SqureTile(onTap: () {}, imagePath: 'assets/apple.png'),
                ],
              ),
              const SizedBox(height: 20),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member?',
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
