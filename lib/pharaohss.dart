import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_09/pharahosl_ist.dart';

class Groub extends StatefulWidget {
  const Groub({Key? key}) : super(key: key);

  @override
  _GroubState createState() => _GroubState();
}

class _GroubState extends State<Groub> {
  final PharaohData pharaohData = PharaohData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Row(
              children: [
                Icon(Icons.notification_add),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (cyx, i) => const SizedBox(width: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: pharaohData.pharaoh.length,
                  itemBuilder: (ctx, index) {
                    return SizedBox(
                      width: 64,
                      height: 64,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            pharaohData.getImage(index),
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 600,
            )
          ],
        )
        // GridView.builder(
        //   itemCount: pharaohData.pharaoh.length,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     crossAxisSpacing: 10.0,
        //     mainAxisSpacing: 10.0,
        //   ),
        //   itemBuilder: (BuildContext context, int index) {
        //     return GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => PharaohDetailPage(
        //                     pharaohData: pharaohData, index: index)));
        //       },
        //       child:
        //       // Container(
        //       //   width: 64,
        //       //   height: 64,
        //       //   decoration: const BoxDecoration(
        //       //     boxShadow: [
        //       //       BoxShadow(
        //       //         blurRadius: 5,
        //       //         color: Colors.black38,
        //       //         offset: Offset(0, 2),
        //       //       ),
        //       //     ],
        //       //   ),
        //       //   // child: Stack(
        //       //   //   // fit: StackFit.expand,
        //       //   //   children: [
        //       //   //     // const HeartIconButton(),
        //       //   //     // Positioned(
        //       //   //     //   top: 0,
        //       //   //     //   left: 0,
        //       //   //     //   right: 0,
        //       //   //     //   child: Padding(
        //       //   //     //     padding: const EdgeInsets.all(8.0),
        //       //   //     //     child: Padding(
        //       //   //     //       padding: const EdgeInsets.only(top: 70),
        //       //   //     //       child: Text(
        //       //   //     //         pharaohData.getName(index),
        //       //   //     //         style: const TextStyle(
        //       //   //     //             fontSize: 16,
        //       //   //     //             fontWeight: FontWeight.bold,
        //       //   //     //             color: Colors.white),
        //       //   //     //         textAlign: TextAlign.center,
        //       //   //     //       ),
        //       //   //     //     ),
        //       //   //     //   ),
        //       //   //     // ),
        //       //   //   ],
        //       //   // ),
        //       // ),
        //     );
        //   },
        // ),
        );
  }
}
