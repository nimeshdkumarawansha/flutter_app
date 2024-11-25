import 'package:flutter/material.dart';

import '../components/color.dart';
import '../widgets/search_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrayColor, // Dark background color
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // "Menu" text with Icon
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
              const Spacer(), // Pushes the logo to the right
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
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_app/components/color.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   Widget videoTile() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           // Video placeholder
//           Container(
//             height: 200,
//             color: Colors.black,
//             child: Center(
//               child: Text(
//                 "Video",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),

//           // Progress bar and overlay button
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 width: 250,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               const SizedBox(width: 10),

//               // see all white back ground text black button
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: kGreenColor,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Text(
//                   "See All",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kGrayColor,
//       body: ListView(
//         padding: const EdgeInsets.all(10),
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           videoTile(),
//           videoTile(),
//           videoTile(),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     home: Home(),
//   ));
// }
