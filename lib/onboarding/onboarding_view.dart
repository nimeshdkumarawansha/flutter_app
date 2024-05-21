import 'package:flutter/material.dart';
import 'package:flutter_app/component/color.dart';
import 'package:flutter_app/onboarding/onboarding_items.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = OnBoardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip Butto
                  TextButton(
                    onPressed: () {
                      pageController.jumpToPage(controller.items.length - 1);
                    },
                    child: Text("Skip"),
                  ),
                  // Indicator
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(microseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey,
                      activeDotColor: kPrimaryColor,
                    ),
                  ),
                  // Next Button
                  TextButton(
                    onPressed: () => pageController.nextPage(
                      duration: const Duration(microseconds: 600),
                      curve: Curves.easeIn,
                    ),
                    child: Text("Next"),
                  ),
                ],
              ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            onPageChanged: (index) => setState(
                () => isLastPage = controller.items.length - 1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image),
                  const SizedBox(height: 15),
                  Text(
                    controller.items[index].title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    controller.items[index].description,
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget getStarted() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kPrimaryColor,
        ),
        width: MediaQuery.of(context).size.width * .9,
        height: 55,
        child: TextButton(
          onPressed: () async {
            final press = await SharedPreferences.getInstance();
            press.setBool("onBoarding", true);

            if (!mounted) return;

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ));
          },
          child: const Text(
            "Get started",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
