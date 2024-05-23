import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/components/squre_tile.dart';
import 'package:flutter_app/pages/Auth/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in methood
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.red),
          );
        });

    // try signin
  }

//error message to user
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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

              // or contunue with
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
              const SizedBox(
                height: 30,
              ),

              // google + applesign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SqureTile(onTap: () => {}, imagePath: 'assets/google.png'),
                  const SizedBox(
                    width: 25,
                  ),
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
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ));
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
