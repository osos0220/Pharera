import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Pharera/pharaoh_show.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/Check.dart';
import 'favorites_provider.dart'; // Import your favorites provider

class FavImagePage extends StatefulWidget {
  const FavImagePage({super.key});

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
        'index': index,
        'data': IsArab() ? data.pharaoh_ar[index] : data.pharaoh_en[index],
      };
    }).toList();
    setState(() {
      _likedImages = images;
    });
  }

  void _navigateToDetailPage(BuildContext context, int index) {
    final pharaohData = PharaohData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PharaohDetailPage(
          pharaohData: pharaohData,
          index: index,
        ),
      ),
    );
  }

  void _unlikeImage(int index) {
    favoritesProvider.toggleFavorite(index);
    _fetchLikedImages(); // Refresh the liked images list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Center(
        child: _likedImages.isEmpty
            ?  Text(S.of(context).NoLike)
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0, // Adjust aspect ratio as needed
          ),
          itemCount: _likedImages.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> imageData = _likedImages[index]['data'];
            int dataIndex = _likedImages[index]['index'];
            return GestureDetector(
              onLongPress: () => _unlikeImage(dataIndex), // Handle unlike on long press
              onTap: () => _navigateToDetailPage(context, dataIndex),
              child: Stack(
                children: [
                  Container(
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
                      child: AspectRatio(
                        aspectRatio: 1.0, // Ensure aspect ratio matches child image
                        child: Image.asset(
                          imageData['image'] ?? '', // Adjust to your data structure
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () => _unlikeImage(dataIndex),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}