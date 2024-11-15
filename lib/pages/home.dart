import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Auth/otp_screen.dart';
import 'package:flutter_app/pages/Auth/register.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              // final press = await SharedPreferences.getInstance();
              // press.setBool("onBoarding", false);

               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ));
            },
            child: const Text("Register Page"),
          ),

          TextButton(
            onPressed: () async {

               Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OTPScreen(),
                  ));
            },
            child: const Text("OTP Screen"),
          ),
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
