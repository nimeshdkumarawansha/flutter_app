import 'package:flutter/material.dart';
import 'package:flutter_app/onboarding/onboarding_view.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final press = await SharedPreferences.getInstance();
  final onBoarding = press.getBool("onBoarding") ?? false;
  runApp(MyApp(onBoarding: onBoarding,));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  const MyApp({super.key, this.onBoarding = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: onBoarding ? const Home() : OnBoardingView(),
    );
  }
}