import "package:flutter/material.dart";


Widget hotspotButton
    ({String? text, IconData? icon, VoidCallback? onPressed}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.black38),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: onPressed,
        child: Icon(icon),
      ),
      text != null
          ? Container(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(child: Text(text)),
      )
          : Container(),
    ],
  );
}

// class HotSpotButton extends StatelessWidget {
//   const HotSpotButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TextButton(
//           style: ButtonStyle(
//             shape: MaterialStateProperty.all(const CircleBorder()),
//             backgroundColor: MaterialStateProperty.all(Colors.black38),
//             foregroundColor: MaterialStateProperty.all(Colors.white),
//           ),
//           onPressed: onPressed,
//           child: Icon(icon),
//         ),
//         text != null
//             ? Container(
//           padding: const EdgeInsets.all(4.0),
//           decoration: const BoxDecoration(
//               color: Colors.black38,
//               borderRadius: BorderRadius.all(Radius.circular(4))),
//           child: Center(child: Text(text)),
//         )
//             : Container(),
//       ],
//     );
//   }
// }
