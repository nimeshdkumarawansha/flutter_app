import 'package:flutter/material.dart';

class SqureTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SqureTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        child: Image.asset(
          imagePath,
          height: 50,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
