import 'package:Pharera/generated/l10n.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'favorites_provider.dart'; // Import your favorites provider
import 'video_item.dart'; // Separate file for VideoItem widget

class FavVideoPageOld extends StatefulWidget {
  const FavVideoPageOld({super.key});

  @override
  _FavVideoPageOldState createState() => _FavVideoPageOldState();
}

class _FavVideoPageOldState extends State<FavVideoPageOld> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = FavoritesProvider(); // Initialize favorites provider

    List<String> oldVideoAssets = [
      'assets/videos/video1.mp4',
      'assets/videos/video2.mp4',
      'assets/videos/video3.mp4',
      'assets/videos/video4.mp4',
      'assets/videos/video5.mp4',
      'assets/videos/video6.mp4',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Show),
      ),
      body: FutureBuilder(
        future: favoritesProvider.loadFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<String> favoriteOldVideos = favoritesProvider.favoriteVideoPaths
                .where((video) => oldVideoAssets.contains(video))
                .toList();

            if (favoriteOldVideos.isEmpty) {
              return Center(child: Text(S.of(context).NoVIDEO));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Only one container per row
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: favoriteOldVideos.length,
                itemBuilder: (context, index) {
                  final videoPath = favoriteOldVideos[index];
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
