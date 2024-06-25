import 'package:Pharera/generated/l10n.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'favorites_provider.dart'; // Import your favorites provider
import 'video_item.dart'; // Separate file for VideoItem widget

class FavVideoPageNew extends StatefulWidget {
  const FavVideoPageNew({super.key});

  @override
  _FavVideoPageNewState createState() => _FavVideoPageNewState();
}

class _FavVideoPageNewState extends State<FavVideoPageNew> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = FavoritesProvider(); // Initialize favorites provider

    List<String> newVideoAssets = [
      'assets/videos/video7.mp4',
      'assets/videos/video8.mp4',
      'assets/videos/video9.mp4',
      'assets/videos/video10.mp4',
      'assets/videos/video11.mp4',
      'assets/videos/video12.mp4',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).video),
      ),
      body: FutureBuilder(
        future: favoritesProvider.loadFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<String> favoriteNewVideos = favoritesProvider.favoriteVideoPaths
                .where((video) => newVideoAssets.contains(video))
                .toList();

            if (favoriteNewVideos.isEmpty) {
              return Center(child: Text(S.of(context).NoVIDEO));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Only one container per row
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: favoriteNewVideos.length,
                itemBuilder: (context, index) {
                  final videoPath = favoriteNewVideos[index];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width * 0.9, // Slightly smaller width
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
                        child: AspectRatio(
                          aspectRatio: 16 / 9, // Set aspect ratio to 16:9
                          child: VideoItem(
                            videoAssetPath: videoPath,
                            showPlayButton: true,
                            showReplayButton: false,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: 30,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              favoritesProvider.toggleVideoFavorite(videoPath);
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
