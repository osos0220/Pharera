import 'package:Pharera/generated/l10n.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'favorites_provider.dart'; // Import your favorites provider
import 'video_item.dart'; // Separate file for VideoItem widget

class FavVideoPage extends StatefulWidget {
  const FavVideoPage({super.key});

  @override
  _FavVideoPageState createState() => _FavVideoPageState();
}

class _FavVideoPageState extends State<FavVideoPage> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = FavoritesProvider(); // Initialize favorites provider

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: FutureBuilder(
        future: favoritesProvider.loadFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (favoritesProvider.favoriteVideoPaths.isEmpty) {
            return  Center(child: Text(S.of(context).NoVIDEO));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Only one container per row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: favoritesProvider.favoriteVideoPaths.length,
              itemBuilder: (context, index) {
                final videoPath = favoritesProvider.favoriteVideoPaths.elementAt(index);
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
                        aspectRatio: 16/9, // Set aspect ratio to 16:9
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
        },
      ),
    );
  }
}

class VideoItem extends StatefulWidget {
  final String videoAssetPath;
  final bool showPlayButton;
  final bool showReplayButton;

  const VideoItem({super.key, 
    required this.videoAssetPath,
    this.showPlayButton = true,
    this.showReplayButton = false,
  });

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: false,
      aspectRatio: _controller.value.aspectRatio,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightBlue,
      ),
      allowPlaybackSpeedChanging: true,
      allowedScreenSleep: false,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Chewie(
          controller: _chewieController,
        ),
        if (widget.showPlayButton)
          Center(
            child: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                _chewieController.play();
              },
            ),
          ),
        if (widget.showReplayButton)
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () {
                _chewieController.seekTo(Duration.zero);
              },
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    _controller.pause();
  }
}