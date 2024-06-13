// import 'package:Pharera/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:Pharera/sign_in.dart';
//
// class Signuo extends StatefulWidget {
//   const Signuo({super.key});
//
//   @override
//   State<Signuo> createState() => _SignuoState();
// }
//
// class _SignuoState extends State<Signuo> {
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   final int _maxPasswordLength = 32;
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 226, 226, 226),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 226, 226, 226),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             children: [
//                Padding(
//                 padding: const EdgeInsets.only(right: 30, top: 20),
//                 child: Text(
//                   S.of(context).create,
//                   style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 10,),
//               Column(
//                 children: [
//                    Padding(
//                     padding: const EdgeInsets.only(right: 220,top: 20),
//                     child: Text(S.of(context).name,style:const TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
//                   ),
//                   const Padding(
//                       padding: EdgeInsets.only(top: 5),
//                       child:  TextField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(100.0),
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//                         ),
//                       )
//                   ),
//                  Padding(
//                     padding: const EdgeInsets.only(right: 290,top: 10),
//                     child: Text(S.of(context).email,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
//                   ),
//                   const Padding(
//                       padding: EdgeInsets.only(top: 5),
//                       child:  TextField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(100.0),
//                             ),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//                         ),
//                       )
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 160,top: 20),
//                     child: SizedBox(width: 200,child: Text(S.of(context).password,style:const TextStyle(fontSize: 22,fontWeight: FontWeight.w800),)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: TextField(
//                       obscureText: _obscurePassword,
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100.0),
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                             color: Colors.grey,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscurePassword = !_obscurePassword;
//                             });
//                           },
//                         ),
//                         counterText: "${_passwordController.text.length}/$_maxPasswordLength", // Show character count
//                         hintText: S.of(context).enterp,
//                       ),
//                       maxLength: _maxPasswordLength,
//                     ),
//                   ),
//                    Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: SizedBox(
//                       width: 350,
//                       child: Row(
//                         children: [
//                           Text(S.of(context).Conform,style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: TextField(
//                       obscureText: _obscureConfirmPassword,
//                       controller: _confirmPasswordController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(100.0),
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
//                             color: Colors.grey,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureConfirmPassword = !_obscureConfirmPassword;
//                             });
//                           },
//                         ),
//                         counterText: "${_confirmPasswordController.text.length}/$_maxPasswordLength", // Show character count
//                         hintText: S.of(context).Conform,
//                       ),
//                       maxLength: _maxPasswordLength,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30),
//                     child: TextButton(
//                       onPressed: (){
//                         // Add your sign-up functionality here
//                       },
//                       child: Container(
//                         width: 180,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: const Color(0xFFAE9E82),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.5),
//                               spreadRadius: 5,
//                               blurRadius: 7,
//                               offset: const Offset(0, 3), // changes position of shadow
//                             ),
//                           ],
//                         ),
//                         child:  Center(
//                           child: Text(
//                             S.of(context).signup,
//                             style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                        Padding(
//                         padding: const EdgeInsets.only(left: 70,top: 10),
//                         child: Text(
//                           S.of(context).haveaccount,
//                           style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
//                         },
//                         child:  Padding(
//                           padding: const EdgeInsets.only(),
//                           child: Text(
//                             S.of(context).login,
//                             style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
