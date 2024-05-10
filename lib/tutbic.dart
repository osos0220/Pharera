import 'package:flutter/material.dart';
import 'Fav_but.dart';


class TutPic extends StatelessWidget {
  const TutPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define a list of images and videos
    final List<Map<String, String>> items = [
      {"type": "image", "path": "assets/images/amnthotb el talt (1).jpg"},
      {"type": "image", "path": "assets/images/hatshbsot.jpg"},
      {"type": "image", "path": "assets/images/to7tmos.jpg"},
      {"type": "image", "path": "assets/images/akhnton.jpg"},
      {"type": "image", "path": "assets/images/قناع-الملك-توت-عنخ-آمون.jpg"},
      {"type": "image", "path": "assets/images/sonsrt1.jpg"},
      {"type": "image", "path": "assets/images/sonsrt3.jpg"},
      {"type": "image", "path": "assets/images/wel1.jpg"},
      {"type": "image", "path": "assets/images/wel2.jpg"},
      {"type": "image", "path": "assets/images/wel3.jpg"},
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (_, index) {
                      final item = items[index];
                      if (item['type'] == 'image') {
                        return InkWell(
                          onTap: () {
                            // Open image in full-screen window
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Scaffold(
                                  appBar: AppBar(),
                                  body: Center(
                                    child: Image.asset(
                                      item['path']!, // Use the image path
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Stack(
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
                                    item['path']!, // Use the image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const HeartIconButton(),
                            ],
                          ),
                        );
                      } else if (item['type'] == 'video') {
                        // You can replace this with your video widget
                        return Container(
                          width: 400,
                          height: 350,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              'Video Placeholder', // Placeholder for video
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink(); // Return an empty widget by default
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
