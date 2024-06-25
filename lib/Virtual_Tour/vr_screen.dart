import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Vr_screen extends StatefulWidget {
  const Vr_screen({super.key, this.title});

  final String? title;

  @override
  Vr_screenState createState() => Vr_screenState();
}

class Vr_screenState extends State<Vr_screen> {
  int _panoId = 0;
  Timer? _gazeTimer;
  bool _isGazing = false;
  double _gazeProgress = 0;

  List<Image> panoImages = [
    Image.asset('assets/images/360_images/Entrance1.webp'), // 0
    Image.asset('assets/images/360_images/Entrance2.webp'), // 1
    Image.asset('assets/images/360_images/1.webp'),         // 2
    Image.asset('assets/images/360_images/5.webp'),         // 3
    Image.asset('assets/images/360_images/2.1.webp'),       // 4
    Image.asset('assets/images/360_images/2.4.webp'),       // 5
    Image.asset('assets/images/360_images/3.4.webp'),       // 6
    Image.asset('assets/images/360_images/4.1.1.1.webp'),   // 7
    Image.asset('assets/images/360_images/4.2.3.1.webp'),   // 8
    Image.asset('assets/images/360_images/4.3.1.1.webp'),   // 9
    Image.asset('assets/images/360_images/4.3.3.1.webp'),   // 10
    Image.asset('assets/images/360_images/4.4.2.webp'),     // 11
    Image.asset('assets/images/360_images/4.5.webp'),       // 12
  ];

  final List<List<Map<String, dynamic>>> hotspotsData = [
    // Entrance1
    [
      {"latitude": 6.6, "longitude": 159.1, "targetPanoId": 1, "text": "يلا بينا"},
    ],
    // Entrance2
    [
      {"latitude": 4.7, "longitude": 97.4, "targetPanoId": 0, "text": "متاكد؟"},
      {"latitude": 2.0, "longitude": -107.6, "targetPanoId": 2, "text": "اللي بعده"},
    ],
    // 1
    [
      {"latitude": -0.9, "longitude": 160.4, "targetPanoId": 1, "text": "برا"},
      {"latitude": -2.4, "longitude": 2.7, "targetPanoId": 3, "text": "يلا نكمل"},
    ],
    // 5
    [
      {"latitude": -0.2, "longitude": -120.4, "targetPanoId": 1, "text": "نرجع؟"},
      {"latitude": 0.3, "longitude": -25.6, "targetPanoId": 4, "text": "نكمل"},
    ],
    // 2.1
    [
      {"latitude": -5.4, "longitude": -172.16, "targetPanoId": 3, "text": "نرجع؟"},
      {"latitude": 0.1, "longitude": 15.9, "targetPanoId": 5, "text": "نكمل"},
    ],
    // 2.4
    [
      {"latitude": -21.2, "longitude": -5.6, "targetPanoId": 4, "text": "نرجع؟"},
      {"latitude": -0.2, "longitude": -120.4, "targetPanoId": 6, "text": "نكمل"},
    ],
    // 3.4
    [
      {"latitude": -8.3, "longitude": -99.0, "targetPanoId": 5, "text": "نرجع؟"},
      {"latitude": 4.7, "longitude": 124.2, "targetPanoId": 7, "text": "نكمل"},
    ],
    // 4.1.1.1
    [
      {"latitude": 3.5, "longitude": -23.3, "targetPanoId": 8, "text": "نكمل"},
    ],
    // 4.2.3.1
    [
      {"latitude": -13.9, "longitude": 129.9, "targetPanoId": 6, "text": "نرجع؟"},
      {"latitude": 4.7, "longitude": -19.0, "targetPanoId": 9, "text": "نكمل"},
    ],
    // 4.3.1.1
    [
      {"latitude": -12.8, "longitude": -174.7, "targetPanoId": 8, "text": "نرجع؟"},
      {"latitude": -3.5, "longitude": -11.6, "targetPanoId": 10, "text": "نكمل"},
    ],
    // 4.3.3.1
    [
      {"latitude": -14.4, "longitude": -122.1, "targetPanoId": 9, "text": "نرجع؟"},
      {"latitude": 6.1, "longitude": 64.8, "targetPanoId": 11, "text": "نكمل"},
    ],
    // 4.4.2
    [
      {"latitude": -8.0, "longitude": 63.0, "targetPanoId": 10, "text": "نرجع؟"},
      {"latitude": 7.5, "longitude": -109.1, "targetPanoId": 12, "text": "نكمل"},
    ],
    // 4.5
    [
      {"latitude": 4.0, "longitude": 176.6, "targetPanoId": 11, "text": "ننزل؟"},
      {"latitude": -0.3, "longitude": 94.1, "targetPanoId": 0, "text": "نعيد من اول"},
    ],
  ];

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {});
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    bool isGazingAtAnyHotspot = false;
    for (var hotspot in hotspotsData[_panoId]) {
      double hotspotLat = hotspot["latitude"];
      double hotspotLon = hotspot["longitude"];
      double hotspotRadius = 10.0; // Adjust as needed for your hotspot size

      bool isGazingAtHotspot = (latitude - hotspotLat).abs() < hotspotRadius &&
          (longitude - hotspotLon).abs() < hotspotRadius;

      if (isGazingAtHotspot) {
        isGazingAtAnyHotspot = true;
        if (!_isGazing) {
          _isGazing = true;
          _startGazeTimer(() {
            setState(() {
              _panoId = hotspot["targetPanoId"];
            });
          });
        }
        break;
      }
    }

    if (!isGazingAtAnyHotspot && _isGazing) {
      _isGazing = false;
      _gazeTimer?.cancel();
      setState(() {
        _gazeProgress = 0;
      });
    }
  }

  void _startGazeTimer(VoidCallback action) {
    _gazeTimer?.cancel();
    const int duration = 2000;
    const int tickInterval = 100;
    int ticks = 0;

    _gazeTimer =
        Timer.periodic(const Duration(milliseconds: tickInterval), (timer) {
          setState(() {
            _gazeProgress = ticks / (duration / tickInterval);
          });
          ticks++;

          if (ticks >= duration / tickInterval) {
            timer.cancel();
            action();
            _isGazing = false;
            setState(() {
              _gazeProgress = 0;
            });
          }
        });
  }

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    print('dispose');
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _gazeTimer?.cancel();
    super.dispose();
  }

  Widget hotspotButton({required Map<String, dynamic> hotspot}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: _isGazing ? _gazeProgress : 0,
              backgroundColor: Colors.black38,
              color: Colors.white,
            ),
            const Icon(Icons.double_arrow, color: Colors.white),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Center(
            child: Text(
              hotspot["text"] ?? "",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPanorama() {
    List<Map<String, dynamic>> currentHotspots = hotspotsData[_panoId];

    return PanoramaViewer(
      sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,
      hotspots: currentHotspots.map((hotspot) {
        return Hotspot(
          latitude: hotspot["latitude"],
          longitude: hotspot["longitude"],
          width: 90.0,
          height: 80.0,
          widget: hotspotButton(hotspot: hotspot),
        );
      }).toList(),
      child: panoImages[_panoId],
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    print('build');

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
              width: screenWidth / 2,
              height: screenHeight,
              child: ClipRect(child: buildPanorama())),
          SizedBox(
              width: screenWidth / 2,
              height: screenHeight,
              child: ClipRect(child: buildPanorama())),
        ],
      ),
    );
  }
}

