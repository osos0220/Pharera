import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
class SubtitleLB {
  final Duration start;
  final Duration end;
  final String text;

  SubtitleLB({
    required this.start,
    required this.end,
    required this.text,
  });
}

class LibSyncPage extends StatefulWidget {
  const LibSyncPage({
    super.key,
    required this.subtitlePaths,
    required this.video,
    required this.title,
  });

  final Map<String, String> subtitlePaths;
  final String video;
  final String title;

  @override
  _LibSyncPageState createState() => _LibSyncPageState();
}

class _LibSyncPageState extends State<LibSyncPage> {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  String displayedSubtitle = "";
  List<SubtitleLB> subtitles = [];
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    // Lock orientation to portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Initialize the video player controller with the video asset
    videoPlayerController = VideoPlayerController.asset(widget.video);
    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      setState(() {});
      videoPlayerController.addListener(_updateSubtitle);
    });

    // Load initial subtitles
    _loadSubtitles();
  }

  Future<void> _loadSubtitles() async {
    final String srtFilePath = widget.subtitlePaths[selectedLanguage]!;
    final List<SubtitleLB> parsedSubtitles = await loadSubtitles(srtFilePath);
    setState(() {
      subtitles = parsedSubtitles;
      displayedSubtitle = "";
    });
  }

  Future<List<SubtitleLB>> loadSubtitles(String filePath) async {
    final String srtContent = await rootBundle.loadString(filePath);
    final List<SubtitleLB> subtitles = [];

    final List<String> lines = srtContent.split('\n');
    int i = 0;
    while (i < lines.length) {
      final index = int.tryParse(lines[i].trim());
      if (index != null) {
        i++;
        final times = lines[i].trim().split(' --> ');
        final start = _parseDuration(times[0]);
        final end = _parseDuration(times[1]);
        i++;
        final text = StringBuffer();
        while (i < lines.length && lines[i].trim().isNotEmpty) {
          text.write('${lines[i].trim()} ');
          i++;
        }
        subtitles.add(SubtitleLB(start: start, end: end, text: text.toString().trim()));
      }
      i++;
    }
    return subtitles;
  }

  Duration _parseDuration(String time) {
    final parts = time.split(':');
    final secondsParts = parts[2].split(',');
    return Duration(
      hours: int.parse(parts[0]),
      minutes: int.parse(parts[1]),
      seconds: int.parse(secondsParts[0]),
      milliseconds: int.parse(secondsParts[1]),
    );
  }

  void _updateSubtitle() {
    final currentPosition = videoPlayerController.value.position;
    final subtitle = subtitles.firstWhere(
          (subtitle) =>
      currentPosition >= subtitle.start && currentPosition <= subtitle.end,
      orElse: () => SubtitleLB(start: Duration.zero, end: Duration.zero, text: ''),
    );

    if (subtitle.text != displayedSubtitle) {
      setState(() {
        displayedSubtitle = subtitle.text;
      });
    }
  }

  @override
  void dispose() {
    // Dispose of the video player controller to free up resources
    videoPlayerController.dispose();

    // Unlock orientation to allow all orientations again
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
        actions: [
          DropdownButton<String>(
            value: selectedLanguage,
            icon: const Icon(Icons.language, color: Colors.black),
            onChanged: (String? newValue) {
              setState(() {
                selectedLanguage = newValue!;
                _loadSubtitles();
              });
            },
            items: widget.subtitlePaths.keys.map<DropdownMenuItem<String>>((String key) {
              return DropdownMenuItem<String>(
                value: key,
                child: Text(key, style: const TextStyle(color: Colors.black)),
              );
            }).toList(),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                // Display the video player
                AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController),
                ),
                // Restart button
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white54,
                    ),
                    child: IconButton(
                        onPressed: () {
                          videoPlayerController.seekTo(Duration.zero);
                          videoPlayerController.play();
                        },
                        icon: const Icon(Icons.restart_alt)),
                  ),
                ),
                // Play/Pause button
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white54,
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (videoPlayerController.value.isPlaying) {
                              videoPlayerController.pause();
                            } else {
                              videoPlayerController.play();
                            }
                          });
                        },
                        icon: Icon(
                          videoPlayerController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        )),
                  ),
                ),
                // Subtitle container with blur effect
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4.0,
                        sigmaY: 4.0,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(color: Colors.black87, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          displayedSubtitle,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Show a loading indicator while the video is being initialized
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
