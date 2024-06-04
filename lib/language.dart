import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:  const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 226, 226, 226), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           InkWell(
            onTap: (){
              var locale = const Locale('en', 'Us');
                Get.updateLocale(locale);
            },
             child: Container(width: 200, height: 50, decoration:  BoxDecoration(
              color: const Color.fromARGB(255, 174, 158, 130),
               boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.language),
                Text(S.of(context).English,style: const TextStyle(fontSize: 25),)
              ],
             ),
             
             
             ),
           ),
            const SizedBox(height: 30),
             InkWell(
            onTap: (){
              var locale = const Locale('ar', 'arb');
                Get.updateLocale(locale);
            },
             child: Container(width: 200, height: 50, decoration:  BoxDecoration(
              color: const Color.fromARGB(255, 174, 158, 130),
               boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
              
              borderRadius: const BorderRadius.all(Radius.circular(20))),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.language),
                Text(S.of(context).arabic , style: const TextStyle(fontSize: 25),)
              ],
             ),
             
             
             ),
           ),
          ],
        ),
      ),
    );
  }
}