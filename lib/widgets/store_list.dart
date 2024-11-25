import 'package:flutter/material.dart';
import 'store_card.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          StoreCard(
            imagePath: 'assets/images/store/tad_store.jpeg',
            storeName: 'TaD',
            buttonText: 'TaD Store',
          ),
          StoreCard(
            imagePath: 'assets/images/store/fashanbug.jpeg',
            storeName: 'TaD',
            buttonText: 'TaD Store',
          ),
          StoreCard(
            imagePath: 'assets/images/store/fashanbug.jpeg',
            storeName: 'TaD',
            buttonText: 'TaD Store',
          ),
          StoreCard(
            imagePath: 'assets/images/store/fashanbug.jpeg',
            storeName: 'TaD',
            buttonText: 'TaD Store',
          ),
          // StoreCard(
          //   imagePath: 'assets/images/store/fashion_bug.jpg',
          //   storeName: 'FASHION BUG',
          //   buttonText: 'See All',
          // ),
          // StoreCard(
          //   imagePath: 'assets/images/store/opel.jpg',
          //   storeName: 'OPEL',
          //   buttonText: 'See All',
          // ),
          // StoreCard(
          //   imagePath: 'assets/images/store/nolimit.jpg',
          //   storeName: 'NOLIMIT',
          //   buttonText: 'See All',
          // ),
        ],
      ),
    );
  }
}
