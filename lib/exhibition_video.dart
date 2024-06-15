import 'dart:io';
import 'package:Pharera/Check.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'favorites_provider.dart'; // Import your favorites provider

class TutVid extends StatelessWidget {
  const TutVid({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = FavoritesProvider(); // Initialize favorites provider

    List<String> videoAssets = [
      'assets/videos/video1.mp4',
      'assets/videos/video2.mp4',
      'assets/videos/video3.mp4',
      'assets/videos/video4.mp4',
      'assets/videos/video5.mp4',
      'assets/videos/video6.mp4',
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Padding(
                padding: EdgeInsets.only(right: IsArab()? 30 : 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                  child: ListView.separated(
                    itemCount: videoAssets.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: screenHeight * 0.03);
                    },
                    itemBuilder: (_, index) {
                      final videoPath = videoAssets[index];
                      final isFavorite = favoritesProvider.favoriteVideoPaths.contains(videoPath);
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            return Stack(
                              children: [
                                Container(
                                  width: screenWidth * 0.85,
                                  height: screenHeight * 0.32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black
                                   
                                  ),
                                  child: VideoItem(videoAssetPath: videoPath),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 300,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          isFavorite ? Icons.favorite : Icons.favorite_border,
                                          color: isFavorite ? Colors.red : Colors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            favoritesProvider.toggleVideoFavorite(videoPath);
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.download),
                                        onPressed: () {
                                          _downloadVideo(context, videoPath);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _downloadVideo(BuildContext context, String videoAssetPath) async {
    try {
      // Request storage permissions for Android
      if (Platform.isAndroid) {
        var permissionStatus = await Permission.storage.request();
        if (permissionStatus.isDenied) {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text(S.of(context).Permision),
          ));
          return;
        }
      }

      // Determine the directory to save the file
      final directory = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();
      if (directory == null) {
        throw Exception(S.of(context).Directory);
      }

      // Copy asset to a temporary location
      final byteData = await rootBundle.load(videoAssetPath);
      final tempFilePath = '${directory.path}/${videoAssetPath.split('/').last}';
      final file = File(tempFilePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      // Notify user of successful download
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Downloaded to $tempFilePath"),
      ));

      print('File downloaded to: $tempFilePath');
    } catch (e) {
      print(S.of(context).DownloadE);
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text(S.of(context).DownloadF),
      ));
    }
  }
}

class VideoItem extends StatefulWidget {
  final String videoAssetPath;

  const VideoItem({super.key, required this.videoAssetPath});

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
    return Chewie(
      controller: _chewieController,
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