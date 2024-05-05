import 'package:flutter/material.dart';
import 'package:flutter_application_09/Fav_but.dart';

class TutPic extends StatelessWidget {
  const TutPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 55),
                  child: Text(
                    "Exhibitions Pictures",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height, // Use MediaQuery to get the screen height
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: 4, // Set a higher itemCount
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 20);
                      },
                      itemBuilder: (_, index) {
                        return Stack(
                          children: [
                            Container(
                              width: 400,
                              height: 350,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  "assets/images/wel1.jpg", // Adjust the image path accordingly
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const HeartIconButton(),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
