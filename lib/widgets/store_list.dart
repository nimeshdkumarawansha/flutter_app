import 'package:flutter/material.dart';
import 'package:flutter_app/components/color.dart';
import 'store_card.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: kGrayColor,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: const [
            StoreCard(
              imagePath: 'assets/images/store/tad_store.jpeg',
              storeText: 'Browse items by Store',
              buttonText: 'See All',
              storeLogo: 'assets/images/logo/logo-b.png',
            ),
            StoreCard(
              imagePath: 'assets/images/store/fashanbug.jpeg',
              storeText: 'Browse items by Store',
              buttonText: 'See All',
              storeLogo: 'assets/images/store/odel-logo.png',
            ),
            StoreCard(
              imagePath: 'assets/images/store/nolimit.jpeg',
              storeText: 'Browse items by Store',
              buttonText: 'See All',
              storeLogo: 'assets/images/store/nolimit-logo.png',
            ),
          ],
        ),
      ),
    );
  }
}
