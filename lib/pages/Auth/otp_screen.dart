import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/color.dart';
import 'package:flutter_app/components/my_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 50),
            const Text(
              'Please enter the OTP sent to your phone',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOTPField(context),
                  _buildOTPField(context),
                  _buildOTPField(context),
                  _buildOTPField(context),
                  _buildOTPField(context),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            MyButton(onTap: () {}, text: "Submit")
          ],
        ),
      ),
    );
  }

  Widget _buildOTPField(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextField(
        controller: _otpController,
        style: const TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kGrayColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
