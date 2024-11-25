import 'package:flutter/material.dart';
import '../components/color.dart';
import '../widgets/search_bar.dart';
import '../widgets/store_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrayColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.menu, color: Colors.white),
                  const SizedBox(width: 8),
                  const Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/images/logo/logo.png',
                height: 30,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          CustomSearchBar(),
          StoreList(),
        ],
      ),
    );
  }
}