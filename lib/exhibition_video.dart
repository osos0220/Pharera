import 'dart:io';
import 'package:Pharera/Check.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class TutVid extends StatelessWidget {
  const TutVid({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> videoAssets = [
      'assets/videos/video1.mp4',
      'assets/videos/video2.mp4',
      'assets/videos/video3.mp4',
      'assets/videos/video4.mp4',
      'assets/videos/video5.mp4',
      'assets/videos/video6.mp4',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                height: screenHeight * 0.78,
                child: Padding(
                  padding: EdgeInsets.only(right: IsArab()? 30 : 0),
                  child: ListView.separated(
                    itemCount: videoAssets.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: screenHeight * 0.03);
                    },
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: Stack(
                          children: [
                            Container(
                              width: screenWidth * 0.85,
                              height: screenHeight * 0.32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black,
                              ),
                              child: VideoItem(videoAssetPath: videoAssets[index]),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: const Icon(Icons.download),
                                onPressed: () {
                                  _downloadVideo(context, videoAssets[index]);
                                },
                              ),
                            ),
                          ],
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
        content: _buildPriceRow(S.of(context).Directory , "" , tempFilePath),
      ));

      print(_buildPriceRow(S.of(context).file , "" , tempFilePath),);
    } catch (e) {
      print(_buildPriceRow(S.of(context).DownloadE , "" , "$e"),);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Download failed. Please try again."),
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
    _controller = VideoPlayerController.asset(widget.videoAssetPath);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false, // Do not start playing automatically
      looping: true,
      aspectRatio: 16 / 9,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightBlue,
      ),
      allowPlaybackSpeedChanging: true,
      allowedScreenSleep: false,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      placeholder: Container(
        color: Colors.black,
      ),
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

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize(
//       debug: true // Optional: Set false to disable printing logs to console
//   );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const TutVid(),
//     );
//   }
// }
Widget _buildPriceRow(String title, String price , String le) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              le,
              style: const TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

