import 'dart:ui';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class LibSyncPage extends StatefulWidget {
  const LibSyncPage({super.key, required this.text, required this.video,required this.title});
  final String text;
  final String video;
  final String title;

  @override
  _LibSyncPageState createState() => _LibSyncPageState();
}

class _LibSyncPageState extends State<LibSyncPage> {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(widget.video); // replace with your video asset
    _initializeVideoPlayerFuture = videoPlayerController.initialize();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Video Player'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white54,
                    ),
                    child: IconButton(onPressed: (){ // Restart button
                      videoPlayerController.seekTo(Duration.zero);
                      videoPlayerController.play();
                    }, icon: const Icon(Icons.restart_alt)),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white54,
                    ),
                    child: IconButton(onPressed: (){ // Play/Pause button
                      setState(() {
                        if (videoPlayerController.value.isPlaying) {
                              videoPlayerController.pause();
                            } else {
                              videoPlayerController.play();
                            }
                          });
                    }, icon:  Icon(videoPlayerController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,)),
                  ),
                ),

                // Subtitles/Closed Captions
                // Positioned(
                //   bottom: 10,
                //   child: Container(
                //     padding: const EdgeInsets.all(16),
                //     decoration: BoxDecoration(
                //       border: Border.all(width: 1),
                //       borderRadius: BorderRadius.circular(8),
                //       color: Colors.transparent
                //     ),
                //     child: const Text(
                //       'Subtitles/Closed Captions',
                //       style: TextStyle(fontSize: 18),
                //     ),
                //   ),
                // ),
                // Large text inside a scrollable container
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //
                    //   },
                    //   child: const Icon(CupertinoIcons.restart),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRect(
                        child: BackdropFilter(filter: ImageFilter.blur(
                          sigmaX: 4.0,
                          sigmaY: 4.0,
                        ),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                             border: Border.all(color: Colors.black87,
                             width: 3),
                              borderRadius: BorderRadius.circular(20)
                            ),


                            child:  SingleChildScrollView(
                              child: Text(
                                widget.text,

                                style: const TextStyle(fontSize: 16,color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}