// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:video_player/video_player.dart';
import 'package:Pharera/Virtual_Tour/constants.dart';
import 'package:Pharera/Virtual_Tour/libsync_v2.dart';
// import 'package:image_picker/image_picker.dart';
import '../Check.dart';
import 'tour_sub.dart';

// import 'dart:math';
// import 'package:Pharera/Virtual_Tour/custom.dart';

class TourGuide extends StatefulWidget {
  const TourGuide({super.key});

  @override
  State<TourGuide> createState() => _TourGuideState();
}

class _TourGuideState extends State<TourGuide> {
  late GlobalKey<NavigatorState> navigatorKey;
  late VideoPlayerController _videoController;
  List<Subtitle> subtitles = [];
  String currentSubtitle = '';
  String selectedLanguage = IsArab()?'ar': 'en'; // Default language

  int _panoId = 0;

  final List<Image> panoImages = [
    Image.asset('assets/images/tour_guide/0.Entrance1.webp'),
    Image.asset('assets/images/tour_guide/1.Entrance1.1.webp'),
    Image.asset('assets/images/tour_guide/2.Entrance2.webp'),
    Image.asset('assets/images/tour_guide/3.webp'),
    Image.asset('assets/images/tour_guide/4.webp'),
    Image.asset('assets/images/tour_guide/5.webp'),
    Image.asset('assets/images/tour_guide/6.webp'),
    Image.asset('assets/images/tour_guide/7.webp'),
    Image.asset('assets/images/tour_guide/8.Unknown_king.webp'),
    Image.asset('assets/images/tour_guide/9.Senusre_III.webp'),
    Image.asset('assets/images/tour_guide/10.Thutmose_III.webp'),
    Image.asset('assets/images/tour_guide/11.Amenhotep III.webp'),
    Image.asset('assets/images/tour_guide/12.Queen Hatshepsut.webp'),
    Image.asset('assets/images/tour_guide/13.Thutmose III.webp'),
    Image.asset('assets/images/tour_guide/14.King Akhenaten.webp'),
    Image.asset('assets/images/tour_guide/15.Sphinx statue of King Amenemhat III.webp'),
    Image.asset('assets/images/tour_guide/16.Sphinx statue with the names of Kings Ramses II and Merneptah.webp'),
    Image.asset('assets/images/tour_guide/17.statue of King Amenhotep III with the goddess Ra-Horakhty.webp'),
    Image.asset('assets/images/tour_guide/18.statue of the god Ptah.webp'),
    Image.asset('assets/images/tour_guide/19.god Ptah and King Ramses II with the goddess Sekhmet.webp'),
    Image.asset('assets/images/tour_guide/20.Goddess Osiris.webp'),
    Image.asset('assets/images/tour_guide/21.King Ramses II under the protection of one of the deities.webp'),
    Image.asset('assets/images/tour_guide/22.King Ramses II with the goddess Anat.webp'),
    Image.asset('assets/images/tour_guide/23.King Ramses II with the god Ptah-Tatenen.webp'),
    Image.asset('assets/images/tour_guide/24.Hathor Capital.webp'),
    Image.asset('assets/images/tour_guide/25.Last.webp'),
  ];
  final List<String> videoAssets = [
    'assets/videos/tour_guide/0.intro.mp4',
    'assets/videos/tour_guide/1.mp4',
    'assets/videos/tour_guide/2.mp4',
    'assets/videos/tour_guide/3.mp4',
    'assets/videos/tour_guide/4.mp4',
    'assets/videos/tour_guide/5.mp4',
    'assets/videos/tour_guide/6.mp4',
    'assets/videos/tour_guide/7.mp4',
    'assets/videos/tour_guide/8.mp4',
    'assets/videos/tour_guide/9.mp4',
    'assets/videos/tour_guide/10.mp4',
    'assets/videos/tour_guide/11.mp4',
    'assets/videos/tour_guide/12.mp4',
    'assets/videos/tour_guide/13.mp4',
    'assets/videos/tour_guide/14.mp4',
    'assets/videos/tour_guide/15.mp4',
    'assets/videos/tour_guide/16.mp4',
    'assets/videos/tour_guide/17.mp4',
    'assets/videos/tour_guide/18.mp4',
    'assets/videos/tour_guide/19.mp4',
    'assets/videos/tour_guide/20.mp4',
    'assets/videos/tour_guide/21.mp4',
    'assets/videos/tour_guide/22.mp4',
    'assets/videos/tour_guide/23.mp4',
    'assets/videos/tour_guide/24.mp4',
    'assets/videos/tour_guide/25.mp4',
  ];

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
    _initializeVideoAndSubtitles();
  }

  Future<void> _initializeVideoAndSubtitles() async {
    _videoController = VideoPlayerController.asset(videoAssets[_panoId])
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
        _videoController.play(); // Auto play the video
        _videoController.setLooping(false); // Loop the video
        _videoController
            .addListener(_updateSubtitle); // Add listener to update subtitles
      });
    subtitles = await loadSubtitles(selectedLanguage, _panoId);
    _updateSubtitle(); // Update subtitle after loading
  }

  void _updateSubtitle() {
    if (subtitles.isEmpty) {
      setState(() {
        currentSubtitle = '';
      });
      return;
    }
    final currentPosition = _videoController.value.position;
    final subtitle = subtitles.firstWhere(
      (subtitle) =>
          currentPosition >= subtitle.start && currentPosition <= subtitle.end,
      orElse: () =>
          Subtitle(start: Duration.zero, end: Duration.zero, text: ''),
    );
    setState(() {
      currentSubtitle = subtitle.text;
    });
  }

  @override
  void dispose() {
    _disposeVideoController();
    super.dispose();
  }

  void _disposeVideoController() {
    _videoController.removeListener(_updateSubtitle);
    _videoController.dispose();
  }

  void _onPanoChanged(int newPanoId) async {
    _disposeVideoController();
    setState(() {
      _panoId = newPanoId;
      currentSubtitle = '';
    });
    _videoController.removeListener(_updateSubtitle);
    await _videoController.pause();
    await _initializeVideoAndSubtitles();
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId) {
      case 0:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 35,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[0],
        );
        break;
      case 1:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[1],
        );
        break;
      case 2:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[2],
        );
        break;
      case 3:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              longitude: 1.8,
              latitude: 23.3,
              height: 80,
              width: 80,
              widget: hotspotButton(
                text: 'Click me',
                icon: Icons.search_outlined,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibSyncPage(
                        video: 'assets/videos/Libsync/Ramses_II.mp4',
                        title: 'Ramesses-II',
                        subtitlePaths:{
                          'English': 'assets/sub_libsync/0/ramses_en.srt',
                          'Arabic': 'assets/sub_libsync/0/ramses_ar.srt',
                          'French': 'assets/sub_libsync/0/ramses_fr_0.srt',
                          'German': 'assets/sub_libsync/0/ramses_de_0.srt',
                        },
                      ),
                    ),
                  );
                },


              ),
            )
          ],
          child: panoImages[3],
        );
        break;
      case 4:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[4],
        );
        break;
      case 5:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[5],
        );
        break;
      case 6:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              longitude: -0.47,
              latitude: -3.63,
              height: 80,
              width: 80,
              widget: hotspotButton(
                text: 'Click me',
                icon: Icons.info_outline_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibSyncPage(
                        video: 'assets/videos/Libsync/Senusrt_I.mp4',
                        title: 'Senusret I',
                        subtitlePaths:{
                          'English': 'assets/sub_libsync/1/subtitles_en_1.srt',
                          'Arabic': 'assets/sub_libsync/1/subtitles_ar_1.srt',
                          'French': 'assets/sub_libsync/1/subtitles_fr_1.srt',
                          'German': 'assets/sub_libsync/1/subtitles_de_1.srt',
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
          child: panoImages[6],
        );
        break;
      case 7:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[7],
        );
        break;
      case 8:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[8],

        );
        break;
      case 9:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              longitude: -0.47,
              latitude: -3.63,
              height: 80,
              width: 80,
              widget: hotspotButton(
                text: 'Click me',
                icon: Icons.info_outline_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibSyncPage(
                        video: 'assets/videos/Libsync/Senusrt_III.mp4',
                        title: 'Senusrt III',
                        subtitlePaths:{
                          'English': 'assets/sub_libsync/2/subtitles_en_2.srt',
                          'Arabic': 'assets/sub_libsync/2/subtitles_ar_2.srt',
                          'French': 'assets/sub_libsync/2/subtitles_fr_2.srt',
                          'German': 'assets/sub_libsync/2/subtitles_de_2.srt',
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
          child: panoImages[9],
        );
        break;
      case 10:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[10],
        );
        break;
      case 11:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              longitude: -6.1,
              latitude: -9.4,
              height: 80,
              width: 80,
              widget: hotspotButton(
                text: 'Click me',
                icon: Icons.info_outline_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibSyncPage(
                        video: 'assets/videos/Libsync/Amenhotep_III.mp4',
                        title: 'Amenhotep_III',
                        subtitlePaths:{
                          'English': 'assets/sub_libsync/3/subtitles_en_3.srt',
                          'Arabic': 'assets/sub_libsync/3/subtitles_ar_3.srt',
                          'French': 'assets/sub_libsync/3/subtitles_fr_3.srt',
                          'German': 'assets/sub_libsync/3/subtitles_de_3.srt',
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
          child: panoImages[11],
        );
        break;
      case 12:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              longitude: 0.47,
              latitude: -2.63,
              height: 80,
              width: 80,
              widget: hotspotButton(
                text: 'Click me',
                icon: Icons.info_outline_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibSyncPage(
                        video: 'assets/videos/Libsync/Hatshibsut.mp4',
                        title: 'Hatshibsut',
                        subtitlePaths:{
                          'English': 'assets/sub_libsync/4/subtitles_en_4.srt',
                          'Arabic': 'assets/sub_libsync/4/subtitles_ar_4.srt',
                          'French': 'assets/sub_libsync/4/subtitles_fr_4.srt',
                          'German': 'assets/sub_libsync/4/subtitles_de_4.srt',
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
          child: panoImages[12],
        );
        break;
      case 13:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          hotspots: [
            Hotspot(
              longitude: 0.48,
              latitude: 6.7,
              height: 80,
              width: 80,
              widget: hotspotButton(
                text: 'Click me',
                icon: Icons.info_outline_rounded,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibSyncPage(
                        video: 'assets/videos/Libsync/Thutmose_III.mp4',
                        title: 'Thutmose_III',
                        subtitlePaths:{
                          'English': 'assets/sub_libsync/5/subtitles_en_5.srt',
                          'Arabic': 'assets/sub_libsync/5/subtitles_ar_5.srt',
                          'French': 'assets/sub_libsync/5/subtitles_fr_5.srt',
                          'German': 'assets/sub_libsync/5/subtitles_de_5.srt',
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
          child: panoImages[13],
        );
        break;
      case 14:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[14],
        );
        break;
      case 15:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[15],
        );
        break;
      case 16:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[16],
        );
        break;
      case 17:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[17],
        );
        break;
      case 18:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[18],
        );
        break;
      case 19:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[19],
        );
        break;
      case 20:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[20],
        );
        break;
      case 21:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[21],
        );
        break;
      case 22:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[22],
        );
        break;
      case 23:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[23],
        );
        break;
      case 24:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[24],
        );
      case 25:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
            hotspots: [
              Hotspot(
                  longitude: -5.0,
                  latitude: 2.3,
                  width: 48,
                  height: 48,
                  widget: hotspotButton(
                    icon: Icons.zoom_in_map_rounded,
                    onPressed: () {
                      pyramidview(context);
                    },
                  )),
            ],
          child: panoImages[25]
        );
        break;
      default:
        panorama = PanoramaViewer(
          longitude: 0,
          latitude: 0,
          minLatitude: -20,
          minLongitude: -40,
          maxLatitude: 25,
          maxLongitude: 40,
          onViewChanged: (longitude, latitude, tilt) {},
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: panoImages[0],

        );
    }

    return Scaffold(
      body: Stack(
        children: [
          panorama,
          Positioned(
            top: 10,
            left: 10,
            child: BackNForthButton(
              text: selectedLanguage == 'ar' ? 'السابق' : 'Back',
              icon: selectedLanguage == 'ar' ? Icons.arrow_forward : Icons.arrow_back,
              onPressed: _panoId > 0 ? () => _onPanoChanged(_panoId - 1) : null,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: BackNForthButton(
              text: selectedLanguage == 'ar' ? 'التالى' : 'Next',
              icon: selectedLanguage == 'ar' ? Icons.arrow_back : Icons.arrow_forward,
              onPressed: _panoId < panoImages.length - 1 ? () => _onPanoChanged(_panoId + 1) : null,
            ),
          ),
          Positioned(
            top: 10,
            left: 150,
            child: DropdownButton<String>(
              value: selectedLanguage,
              items: const [
                DropdownMenuItem(value: 'ar', child: Text('العربية')),
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'fr', child: Text('Française')),
                DropdownMenuItem(value: 'de', child: Text('Deutsch')),
              ],
              onChanged: (value) async {
                setState(() {
                  selectedLanguage = value!;
                });
                subtitles = await loadSubtitles(selectedLanguage, _panoId);
                _updateSubtitle();
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange.shade300, width: 2.0),
              ),
              width: 170,
              child: Directionality(
                textDirection: selectedLanguage == 'ar' ? TextDirection.rtl : TextDirection.ltr,
                child: Text(
                  currentSubtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: _videoController.value.isInitialized
                ? SizedBox(
              width: 120,
              height: 120 / _videoController.value.aspectRatio,
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}
Widget BackNForthButton({
  required String text,
  required IconData icon,
  required VoidCallback? onPressed,
})
  {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon,color: Colors.orange.shade300,),
      label: Text(text,style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent)
    );
  }
void pyramidview(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text('Pyramid View'),
        contentPadding: const EdgeInsets.all(7.0), // Reduce padding
        content: Image.asset('assets/images/artifacts/pyramid_view.png'),
      );
    },
  );
}