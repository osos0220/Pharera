// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoItem extends StatefulWidget {
//   final String videoAssetPath;
//
//   const VideoItem({super.key, required this.videoAssetPath});
//
//   @override
//   _VideoItemState createState() => _VideoItemState();
// }
//
// class _VideoItemState extends State<VideoItem> {
//   late VideoPlayerController _controller;
//   late ChewieController _chewieController;
//   bool _showThumbnail = true; // State to show/hide thumbnail
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(widget.videoAssetPath)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//     _chewieController = ChewieController(
//       videoPlayerController: _controller,
//       autoPlay: false, // Do not start playing automatically
//       looping: false,
//       aspectRatio: 16 / 9,
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.red,
//         handleColor: Colors.blue,
//         backgroundColor: Colors.grey,
//         bufferedColor: Colors.lightBlue,
//       ),
//       allowPlaybackSpeedChanging: true,
//       allowedScreenSleep: false,
//       deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
//       placeholder: Container(
//         color: Colors.black,
//       ),
//     );
//
//     // Listen for video play event
//     _controller.addListener(() {
//       if (_controller.value.isPlaying) {
//         setState(() {
//           _showThumbnail = false;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Chewie(
//           controller: _chewieController,
//         ),
//         if (_showThumbnail)
//           GestureDetector(
//             onTap: () {
//               _controller.play();
//             },
//             child: Container(
//               color: Colors.black,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/thumbnails/${widget.videoAssetPath.split('/').last.split('.').first}.png',
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: double.infinity,
//                   ),
//                   const Icon(
//                     Icons.play_circle_outline,
//                     color: Colors.white,
//                     size: 80,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//     _chewieController.dispose();
//   }
//
//   @override
//   void deactivate() {
//     super.deactivate();
//     _controller.pause();
//   }
// }
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

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
      autoPlay: false,
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
