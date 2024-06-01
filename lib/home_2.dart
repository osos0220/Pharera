import 'package:flutter/material.dart';
import 'package:Pharera/pharaoh_show.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/pharaohs.dart';

class Pharaohs extends StatelessWidget {
  Pharaohs({super.key});

  final PharaohData pharaohData = PharaohData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextButton(
                          onPressed: () {
                            // Handle SEE ALL button tap
                          },
                          child: const Text(
                            "EXPLORE",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()), // Spacer to push SEE ALL button to the right
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 80),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Groub()));
                        },
                        child: Container(
                          width: 130,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text(
                              "SEE ALL",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                height: 290,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        height: 270,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PharaohDetailPage(
                                      pharaohData: pharaohData, index: index)),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                pharaohData.getImage(index),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
