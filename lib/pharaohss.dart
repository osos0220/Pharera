import 'package:flutter/material.dart';
import 'package:flutter_application_09/Fav_but.dart';
import 'package:flutter_application_09/pharadetails.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GridView.builder(
        itemCount: pharaohData.pharaoh.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => PharaohDetailPage(pharaohData: pharaohData, index: index)));
            },
            child: Container(
              
              decoration: const BoxDecoration( boxShadow: [
                          BoxShadow(
                            
                            blurRadius: 5,
                            color: Colors.black38,
                            offset: Offset(0, 2),
                          ),
                        ],),
              child: Card(
                elevation: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        pharaohData.getImage(index),
                        fit: BoxFit.cover,
                      ),
                    ),
                     const HeartIconButton(),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Text(
                            pharaohData.getName(index),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
