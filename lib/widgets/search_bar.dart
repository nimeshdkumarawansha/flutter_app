import 'package:flutter/material.dart';
import 'package:flutter_app/components/color.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: kGrayColor, // Background color
      child: Row(
        children: [
          // Search Field with Dropdown
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  )),
              child: Row(
                children: [
                  // Search TextField
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search in TaD',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ),
                  // Vertical Divider
                  Container(
                    height: 24,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  // Dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'Select Category',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: 'category1', child: Text('Category 1')),
                        DropdownMenuItem(
                            value: 'category2', child: Text('Category 2')),
                        DropdownMenuItem(
                            value: 'category3', child: Text('Category 3')),
                      ],
                      onChanged: (value) {
                        // Handle category change
                      },
                      underline: Container(), // Remove underline
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      isExpanded: false, // Prevents dropdown from expanding
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(width: 8),
          // Search Icon Button
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.green),
              onPressed: () {
                // Handle search action
              },
            ),
          ),
        ],
      ),
    );
  }
}
