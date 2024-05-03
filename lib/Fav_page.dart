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
                width: 364,
                height: 132,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const AppTextWidget(
                title: "Categories",
                fontSize: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (ctx, i) {
                    return FavoriteButtonCategoryWidget(
                      title: titles[i],
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
