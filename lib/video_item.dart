import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

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
