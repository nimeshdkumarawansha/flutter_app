import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String storeName;
  final String imageUrl;
  final String buttonText;

  const StoreCard({
    super.key,
    required this.storeName,
    required this.imageUrl,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Browse all items',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}