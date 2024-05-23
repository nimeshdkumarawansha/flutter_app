import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/pages/Auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Text editing Controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              // logo
              SizedBox(
                height: 100,
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(height: 75),

              // Let's create an acount for you!
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'SIGNUP',
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

              // conform password text field
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Conform Password',
                obscureText: true,
              ),

              const SizedBox(height: 20),

              // sign in button
              MyButton(onTap: signUserUp, text: "Sign Up"),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have an account?',
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
                            builder: (context) => const Login(),
                          ));
                    },
                    child: const Text(
                      'Login now',
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

  // sign user in methood
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.red),
          );
        });

    // try creating the user

    // check if password confirmed
    if (passwordController.text == confirmPasswordController.text) {
    } else {
      // show error message password not match
      showErrorMessage("Password don't match!");
    }

    // pop the loading circle
    Navigator.pop(context);
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
}
