import 'package:flutter/material.dart';

import 'color.dart';

class StoreCard extends StatelessWidget {
  final String imagePath;
  final String storeText;
  final String buttonText;
  final String storeLogo;

  const StoreCard({
    super.key,
    required this.imagePath,
    required this.storeText,
    required this.buttonText,
    required this.storeLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 2.0,
            ),
            child: Container(
              padding: const EdgeInsets.only(right: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0), // Add border radius
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // store logo
                  // ClipRRect(
                  //   child: Image.asset(
                  //     storeLogo,
                  //     height: 17,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  SizedBox(
                    width: 50,
                  ),
                  // store name
                  Text(
                    storeText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // button
                  TextButton(
                    onPressed: () {
                      // TODO: Implement store navigation
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kGreenColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
