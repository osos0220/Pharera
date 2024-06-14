import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  Set<int> _favoritePharaohIndexes = {};
  Set<String> _favoriteVideoPaths = {}; // Add this line

  Set<int> get favoriteIndexes => _favoritePharaohIndexes;
  Set<String> get favoriteVideoPaths => _favoriteVideoPaths; // Add this getter

  FavoritesProvider() {
    if (_user != null) {
      loadFavorites();
    }
  }

  Future<void> loadFavorites() async {
    if (_user == null) return;

    final snapshot = await _firestore.collection('favorites').doc(_user!.uid).get();
    if (snapshot.exists) {
      _favoritePharaohIndexes = Set<int>.from(snapshot.data()?['pharaohFavorites'] ?? []);
      _favoriteVideoPaths = Set<String>.from(snapshot.data()?['videoFavorites'] ?? []);
    }
  }

  Future<List<Map<String, dynamic>>> fetchTopFavorites() async {
    final querySnapshot = await _firestore.collection('favorites').orderBy('count', descending: true).limit(10).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  void toggleFavorite(int index) {
    if (_favoritePharaohIndexes.contains(index)) {
      _favoritePharaohIndexes.remove(index);
    } else {
      _favoritePharaohIndexes.add(index);
    }
    _updateFavoritesInFirestore();
  }

  void toggleVideoFavorite(String videoPath) {
    if (_favoriteVideoPaths.contains(videoPath)) {
      _favoriteVideoPaths.remove(videoPath);
    } else {
      _favoriteVideoPaths.add(videoPath);
    }
    _updateFavoritesInFirestore();
  }

  void _updateFavoritesInFirestore() {
    if (_user != null) {
      _firestore.collection('favorites').doc(_user!.uid).set({
        'pharaohFavorites': _favoritePharaohIndexes.toList(),
        'videoFavorites': _favoriteVideoPaths.toList(),
      });
    }
  }
}
