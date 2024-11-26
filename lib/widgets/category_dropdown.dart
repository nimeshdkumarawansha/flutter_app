import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final List<String> categories;
  final VoidCallback onClose;
  final Function(String) onCategorySelected;

  const CategoryDropdown({
    Key? key,
    required this.categories,
    required this.onClose,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onClose,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: onClose,
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            SizedBox(width: 4),
                            Text('GO BACK'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => Divider(height: 1),
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        categories[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        onCategorySelected(categories[index]);
                        onClose();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}