import 'package:flutter/material.dart';

import 'app_text_widget.dart';
import 'favorite_button_category_widget.dart';

class favpage extends StatefulWidget {
  const favpage({super.key});

  @override
  State<favpage> createState() => _favpageState();
}

class _favpageState extends State<favpage> {
  final List<String> titles = ["Photos", "Show", "Video"];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppTextWidget(
                title: "Top Favorites",
                fontSize: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: screenWidth*0.9,
                height: screenHeight*0.15,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
               SizedBox(
                height: screenHeight*0.009,
              ),
              const AppTextWidget(
                title: "Categories",
                fontSize: 32,
              ),
               SizedBox(
                height: screenHeight *0.008,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (ctx, i) {
                    return SizedBox(
                      height: 72, // Adjust button height here
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16), // Adjust padding here
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          titles[i],
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, i) {
                    return const SizedBox(height: 24);
                  },
                  itemCount: titles.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
