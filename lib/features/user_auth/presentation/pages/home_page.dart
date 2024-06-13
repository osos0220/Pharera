// import 'package:Pharera/features/user_auth/presentation/pages/profile_page.dart';
// import 'package:Pharera/features/user_auth/presentation/widgets/drawer_widget.dart';
// import 'package:Pharera/features/user_auth/presentation/pages/login_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../global/common/toast.dart';
//
// class HomePageO extends StatelessWidget {
//   const HomePageO({super.key});
//
// //navigate to profile Page
//   void goToProfilePage(BuildContext context) {
//     //pop menu drawer
//     Navigator.pop(context);
//
//     //go to profile page
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => ProfilePage()),
//       (route) => false,
//     );
//   }
//
// //navigate to login Page
//   void signOut(BuildContext context) {
//     FirebaseAuth.instance.signOut();
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//     StrutStyle.fromTextStyle(const TextStyle(fontFamily: 'Vollkorn'));
//     showToast(message: "Successfully signed out");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "HomePage",
//           style: TextStyle(fontFamily: 'Vollkorn'),
//         ),
//       ),
//       drawer: MyDrawer(
//         onProfileTap: () => goToProfilePage(context), // Pass context
//         onSignOut: () => signOut(context),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Center(
//             child: Text("I'm just a girl ",
//                 style: TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Vollkorn',
//                 )),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           GestureDetector(
//               onTap: () {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//                 StrutStyle.fromTextStyle(const TextStyle(fontFamily: 'Vollkorn'));
//                 showToast(message: "Successfully signed out");
//               },
//               child: Container(
//                 height: 45,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 174, 158, 130),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: const Center(
//                   child: Text(
//                     "Sign out",
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 174, 158, 130),
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
