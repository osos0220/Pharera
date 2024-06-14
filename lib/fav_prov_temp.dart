class FavoritesProvider {
  final Set<String> _favoriteVideoPaths = {
    'assets/videos/video3.mp4',
    'assets/videos/video4.mp4',
  };
  final Set<String> _favoriteImagePaths = {
    'assets/images/exi/ramses.jpg',
    'assets/images/exi/masala.jpg',
  };

  Set<String> get favoriteVideoPaths => _favoriteVideoPaths;
  Set<String> get favoriteImagePaths => _favoriteImagePaths;

  Future<List<Map<String, dynamic>>> fetchTopFavorites() async {
    // Simulating a fetch delay
    await Future.delayed(Duration(seconds: 2));

    List<Map<String, dynamic>> favorites = [];

    for (var video in _favoriteVideoPaths) {
      favorites.add({'type': 'video', 'path': video});
    }

    for (var image in _favoriteImagePaths) {
      favorites.add({'type': 'image', 'path': image});
    }

    return favorites;
  }
}
