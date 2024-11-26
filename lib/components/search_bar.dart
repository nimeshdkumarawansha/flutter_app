import 'package:flutter/material.dart';
import 'package:flutter_app/components/color.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final List<String> categories = [
    'T-Shirts',
    'Shirts',
    'Frocks',
    'Trousers',
    'Sports wear',
    'Footwear',
    'Wearables',
  ];

  String selectedCategory = 'Select Category';
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: 0,
        top: offset.dy + size.height,
        width: MediaQuery.of(context).size.width,
        child: Material(
          elevation: 4,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: _hideDropdown,
                        child: Row(
                          children: [
                            Icon(Icons.arrow_left, size: 40),
                            Text('GO BACK'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ...categories
                    .map((category) => Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, right: 40.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  category,
                                  style: TextStyle(fontSize: 16),
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                  _hideDropdown();
                                },
                              ),
                              Divider(height: 1),
                            ],
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: kBlackColor,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    bottomLeft: Radius.circular(6.0),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search in TaD',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 37, 37, 37),
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: const Color.fromARGB(255, 1, 1, 1),
                    ),
                    GestureDetector(
                      onTap: _showDropdown,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              selectedCategory,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.black87),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.search, color: kGreenColor, size: 30),
                onPressed: () {
                  // Handle search action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
