import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'app_text_widget.dart';
import 'fav_image_page.dart'; // Import FavImagePage

class favpage extends StatefulWidget {
  const favpage({Key? key}) : super(key: key);

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
    // Navigate to FavImagePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavImagePage()),
    );
  }

  void _handleShowButtonPress() {
    // Replace with your logic for handling show button press
    print('Show button pressed');
  }

  void _handleVideoButtonPress() {
    // Replace with your logic for handling video button press
    print('Video button pressed');
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppTextWidget(
                title: 'Top Favorites', // Replace with your localization string
                fontSize: 32,
              ),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Â©',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.009),
              const AppTextWidget(
                title: 'Category', // Replace with your localization string
                fontSize: 32,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.008),
              Column(
                children: [
                  SizedBox(
                    height: 72, // Adjust button height here
                    child: ElevatedButton(
                      onPressed: _handlePhotoButtonPress,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16), // Adjust padding here
                        backgroundColor: Colors.black, // Black background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'photo',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white, // White text
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24), // Adjust spacing between buttons
                  SizedBox(
                    height: 72, // Adjust button height here
                    child: ElevatedButton(
                      onPressed: _handleShowButtonPress,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16), // Adjust padding here
                        backgroundColor: Colors.black, // Black background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'show',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white, // White text
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24), // Adjust spacing between buttons
                  SizedBox(
                    height: 72, // Adjust button height here
                    child: ElevatedButton(
                      onPressed: _handleVideoButtonPress,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16), // Adjust padding here
                        backgroundColor: Colors.black, // Black background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'video',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white, // White text
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
