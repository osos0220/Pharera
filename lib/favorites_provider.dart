import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _user = FirebaseAuth.instance.currentUser;
  Set<int> _favoriteIndexes = {};

  Set<int> get favoriteIndexes => _favoriteIndexes;

  Future<void> loadFavorites() async {
    if (_user != null) {
      final snapshot = await _firestore.collection('favorites').doc(_user!.uid).get();
      if (snapshot.exists) {
        _favoriteIndexes = Set<int>.from(snapshot.data()?['favorites'] ?? []);
      }
    }
  }

  void toggleFavorite(int index) {
    if (_favoriteIndexes.contains(index)) {
      _favoriteIndexes.remove(index);
    } else {
      _favoriteIndexes.add(index);
    }
    _updateFavoritesInFirestore();
  }

  void _updateFavoritesInFirestore() {
    if (_user != null) {
      _firestore.collection('favorites').doc(_user!.uid).set({
        'favorites': _favoriteIndexes.toList(),
      });
    }
  }
}
