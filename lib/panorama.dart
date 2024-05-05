import 'package:flutter/material.dart';

class VITPage extends StatelessWidget {
  const VITPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
          SafeArea(child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Image.asset("assets/images/top.jpg"),
          )),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(width: 280,height: 80,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),color: Colors.black,
                boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
              ),
              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/images/ex.jpg",fit: BoxFit.fill,)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(width: 280,height: 80,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/images/eg.jpg",fit: BoxFit.fill,)),
                ),
            ),
            
          ],
        ),
      ),
    );
  }
}
