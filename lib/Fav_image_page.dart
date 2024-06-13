import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/Check.dart';
import 'favorites_provider.dart'; // Import your favorites provider

class FavImagePage extends StatefulWidget {
  @override
  _FavImagePageState createState() => _FavImagePageState();
}

class _FavImagePageState extends State<FavImagePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late FavoritesProvider favoritesProvider; // Declare your favorites provider
  List<Map<String, dynamic>> _likedImages = [];

  @override
  void initState() {
    super.initState();
    favoritesProvider = FavoritesProvider();
    _fetchLikedImages();
  }

  Future<void> _fetchLikedImages() async {
    await favoritesProvider.loadFavorites();
    List<Map<String, dynamic>> images = favoritesProvider.favoriteIndexes.map((index) {
      final data = PharaohData();
      return {
        'data': IsArab() ? data.pharaooh[index] : data.pharaoh[index],
      };
    }).toList();
    setState(() {
      _likedImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Image'),
      ),
      body: Center(
        child: _likedImages.isEmpty
            ? Text('No liked images found.')
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0, // Adjust aspect ratio as needed
          ),
          itemCount: _likedImages.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> imageData = _likedImages[index]['data'];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageData['image'] ?? '', // Adjust to your data structure
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
