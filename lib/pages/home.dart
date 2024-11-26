import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../components/search_bar.dart';
import '../widgets/store_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CustomSearchBar(),
          StoreList(),
        ],
      ),
    );
  }
}
