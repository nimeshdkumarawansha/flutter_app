import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double rating;
  final bool isAuthorized;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.isAuthorized,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main profile content
          Column(
            children: [
              Row(
                children: [
                  // CircleAvatar with gradient border
                  Container(
                    padding: const EdgeInsets.all(4), // Border width
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Colors.red, // Starting color of the gradient
                          Colors.blue, // Ending color of the gradient
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor:
                          Colors.white, // Background color inside the gradient
                      child: ClipOval(
                        child: Image.asset(imageUrl,
                            fit: BoxFit
                                .contain, // Ensures the full image is shown without cropping
                            width:
                                74, // Adjust size to fit inside the inner CircleAvatar
                            height: 74),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        if (isAuthorized)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Authorized member',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 6),
                                FaIcon(
                                  FontAwesomeIcons.crown,
                                  color: Colors.white, // Crown color
                                  size: 14, // Adjust icon size as needed
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        Text('Total ratings: $rating/5'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Positioned edit icon at top right corner
          Positioned(
            top: -10,
            right: -10,
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
