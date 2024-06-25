import 'package:Pharera/Fav_pharaoh_page.dart';
import 'package:Pharera/Fav_show_page.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'app_text_widget.dart';
import 'fav_image_page.dart';
import 'Fav_video_page.dart';
import 'package:Pharera/fav_top.dart'; // Import the TopFavoritesPage

class favpage extends StatefulWidget {
  const favpage({super.key});

  @override
  State<favpage> createState() => _favpageState();
}

class _favpageState extends State<favpage> {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  List<int> _favoriteIndexes = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    if (user != null) {
      DocumentSnapshot doc = await users.doc(user!.uid).get();
      if (doc.exists) {
        List<dynamic> favorites = doc['favorites'] ?? [];
        setState(() {
          _favoriteIndexes = favorites.cast<int>();
        });
      }
    }
  }

  void _handlePhotoButtonPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavImagePage()),
    );
  }

  void _handlePharaohButtonPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavVideoPageOld()),
    );
  }

  void _handleVideoButtonPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavVideoPageNew()),
    );
  }

  void _handleTopFavoritesButtonPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TopFavoritesPage()), // Navigate to TopFavoritesPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226), // Light gray background
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226), // Light gray background
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 AppTextWidget(
                  title:  S.of(context).top, // Replace with your localization string
                  fontSize: 32,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/IMG_1812.jpg', // Replace with your image asset
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Button
                      Positioned.fill(
                        child: ElevatedButton(
                          onPressed: _handleTopFavoritesButtonPress,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0), // Remove padding
                            backgroundColor: Colors.transparent, // Transparent background
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ), child: null,
                          // child:  Center(
                          //   child: Text(
                          //      S.of(context).Trending,
                          //     style: const TextStyle(
                          //       fontSize: 24,
                          //       color: Colors.white, // White text
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              AppTextWidget(
                  title:  S.of(context).category, // Replace with your localization string
                  fontSize: 32,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Stack(
                        children: [
                          // Background Image
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/exi/masala.jpg', // Replace with your image asset
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Button
                          Positioned.fill(
                            child: ElevatedButton(
                              onPressed: _handlePhotoButtonPress,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0), // Remove padding
                                backgroundColor: Colors.transparent, // Transparent background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child:  Center(
                                child: Text(
                                   S.of(context).image,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white, // White text
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24), // Adjust spacing between buttons
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Stack(
                        children: [
                          // Background Image
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/amnthotb el talt (1).jpg', // Replace with your image asset
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Button
                          Positioned.fill(
                            child: ElevatedButton(
                              onPressed: _handleVideoButtonPress,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0), // Remove padding
                                backgroundColor: Colors.transparent, // Transparent background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child:  Center(
                                child: Text(
                                  S.of(context).video,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white, // White text
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24), // Adjust spacing between buttons
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Stack(
                        children: [
                          // Background Image
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/wel1.jpg', // Replace with your image asset
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Button
                          Positioned.fill(
                            child: ElevatedButton(
                              onPressed: _handlePharaohButtonPress,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0), // Remove padding
                                backgroundColor: Colors.transparent, // Transparent background
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child:  Center(
                                child: Text(
                                  S.of(context).Show,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white, // White text
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
