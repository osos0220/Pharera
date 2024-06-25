import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'Check.dart';
import 'favorites_provider.dart';
import 'generated/l10n.dart'; // Import your favorites provider

class TutVid extends StatelessWidget {
  const TutVid({super.key});

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

    List<String> newVideoAssets = [
      'assets/videos/video7.mp4',
      'assets/videos/video8.mp4',
      'assets/videos/video9.mp4',
      'assets/videos/video10.mp4',
      'assets/videos/video11.mp4',
      'assets/videos/video12.mp4',
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(right: IsArab() ? 30 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  S.of(context).Show,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildVideoList(context, oldVideoAssets, favoritesProvider, screenWidth, screenHeight),
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  S.of(context).video,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildVideoList(context, newVideoAssets, favoritesProvider, screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoList(BuildContext context, List<String> videoAssets, FavoritesProvider favoritesProvider, double screenWidth, double screenHeight) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: videoAssets.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: screenHeight * 0.03);
      },
      itemBuilder: (_, index) {
        final videoPath = videoAssets[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              bool isFavorite = favoritesProvider.favoriteVideoPaths.contains(videoPath);
              return Stack(
                children: [
                  Container(
                    width: screenWidth * 0.95,
                    height: screenHeight * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: LazyVideoItem(videoAssetPath: videoPath),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
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
                              isFavorite = !isFavorite; // Immediate UI update
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.download, color: Colors.white),
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
    );
  }

  Future<void> _downloadVideo(BuildContext context, String videoAssetPath) async {
    try {
      // Request storage permissions for Android
      if (Platform.isAndroid) {
        var permissionStatus = await Permission.storage.request();
        if (permissionStatus.isDenied) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).DownloadF),
      ));
    }
  }
}

class LazyVideoItem extends StatefulWidget {
  final String videoAssetPath;

  const LazyVideoItem({super.key, required this.videoAssetPath});

  @override
  _LazyVideoItemState createState() => _LazyVideoItemState();
}

class _LazyVideoItemState extends State<LazyVideoItem> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    _controller = VideoPlayerController.asset(widget.videoAssetPath);
    await _controller!.initialize();
    setState(() {
      _isInitialized = true;
    });
    _chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: false,
      looping: false,
      aspectRatio: _controller!.value.aspectRatio,
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
    return _isInitialized
        ? GestureDetector(
      onTap: () {
        setState(() {
          _chewieController?.play();
        });
      },
      child: Chewie(controller: _chewieController!),
    )
        : Center(
      child: _isInitialized
          ? AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller?.pause();
    super.deactivate();
  }
}
