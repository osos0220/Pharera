// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:Pharera/Virtual_Tour/libsync.dart';
import 'constants.dart';

class FreeExplore extends StatefulWidget {
  const FreeExplore({super.key});

  @override
  State<FreeExplore> createState() => _FreeExploreState();
}

class _FreeExploreState extends State<FreeExplore> {
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  int _panoId = 0;
  // double _lon = 0;
  // double _lat = 0;
  // double _tilt = 0;
  List<Image> panoImages = [
    Image.asset('assets/images/360_images/Entrance1.webp'),
    Image.asset('assets/images/360_images/Entrance2.webp'),
    Image.asset('assets/images/360_images/1.webp'),
    Image.asset('assets/images/360_images/2.1.webp'),
    Image.asset('assets/images/360_images/2.2.webp'),
    Image.asset('assets/images/360_images/2.3.webp'),
    Image.asset('assets/images/360_images/2.4.webp'),
    Image.asset('assets/images/360_images/3.1.webp'),
    Image.asset('assets/images/360_images/3.3.webp'),
    Image.asset('assets/images/360_images/3.4.webp'),
    Image.asset('assets/images/360_images/4.webp'),
    Image.asset('assets/images/360_images/5.webp'),
    Image.asset('assets/images/360_images/6.webp'),
    Image.asset('assets/images/360_images/7.webp'),
    Image.asset('assets/images/360_images/8.webp'),
    Image.asset('assets/images/360_images/9.webp'),
    Image.asset('assets/images/360_images/4.1.1.1.webp'),
    Image.asset('assets/images/360_images/4.1.1.2.webp'),
    Image.asset('assets/images/360_images/4.1.2.webp'),
    Image.asset('assets/images/360_images/4.1.3.1.webp'),
    Image.asset('assets/images/360_images/4.1.3.2.webp'),
    Image.asset('assets/images/360_images/4.2.1.webp'),
    Image.asset('assets/images/360_images/4.2.2.1.webp'),
    Image.asset('assets/images/360_images/4.2.2.2.webp'),
    Image.asset('assets/images/360_images/4.2.3.1.webp'),
    Image.asset('assets/images/360_images/4.2.3.2.webp'),
    Image.asset('assets/images/360_images/4.2.4.1.webp'),
    Image.asset('assets/images/360_images/4.2.4.2.webp'),
    Image.asset('assets/images/360_images/4.3.1.1.webp'),
    Image.asset('assets/images/360_images/4.3.1.2.webp'),
    Image.asset('assets/images/360_images/4.3.2.1.webp'),
    Image.asset('assets/images/360_images/4.3.2.2.webp'),
    Image.asset('assets/images/360_images/4.3.3.1.webp'),
    Image.asset('assets/images/360_images/4.3.3.2.webp'),
    Image.asset('assets/images/360_images/4.3.4.1.webp'),
    Image.asset('assets/images/360_images/4.3.4.2.webp'),
    Image.asset('assets/images/360_images/4.4.1.1.webp'),
    Image.asset('assets/images/360_images/4.4.1.2.webp'),
    Image.asset('assets/images/360_images/4.4.2.webp'),
    Image.asset('assets/images/360_images/4.4.3.webp'),
    Image.asset('assets/images/360_images/4.5.webp'),
  ];
  ImagePicker picker = ImagePicker();

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      // _lon = longitude;
      // _lat = latitude;
      // _tilt = tilt;
    });
  }

  final Map<String, int> _imageMap = {
    // Entrance
    'entrance1': 0,
    'entrance2': 1,
    // Grand Hall
    'grandhall1': 11,
    'grandhall2': 4,
    'grandhall2_2': 5,
    'grandhall2_3': 9,
    'grandhall2_4': 10,
    'grandhall3': 6,
    'grandhall3_3': 7,
    'grandhall3_4': 8,
    'grandhall4': 12,
    'grandhall5': 2,
    'grandhall6': 13,
    'grandhall7': 3,
    'grandhall8': 14,
    'grandhall9': 15,
    // Grand Staircase
    'staircase4_1_1_1': 16,
    'staircase4_1_1_2': 17,
    'staircase4_1_2': 18,
    'staircase4_1_3_1': 19,
    'staircase4_1_3_2': 20,
    // Level 2
    'staircase4_2_1': 21,
    'staircase4_2_2_1': 22,
    'staircase4_2_2_2': 23,
    'staircase4_2_3_1': 24,
    'staircase4_2_3_2': 25,
    'staircase4_2_4_1': 26,
    'staircase4_2_4_2': 27,
    //Level 3
    'staircase4_3_1_1': 28,
    'staircase4_3_1_2': 29,
    'staircase4_3_2_1': 30,
    'staircase4_3_2_2': 31,
    'staircase4_3_3_1': 32,
    'staircase4_3_3_2': 33,
    'staircase4_3_4_1': 34,
    'staircase4_3_4_2': 35,
    //Level 4
    'staircase4_4_1_1': 36,
    'staircase4_4_1_2': 37,
    'staircase4_4_2': 38,
    'staircase4_4_3': 39,
    'staircase4_5': 40,
  };

  // Entrance
  PanoramaViewer _entrance1() {
    return PanoramaViewer(
      // animSpeed: 0.5,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,
      longitude:-10.0 ,
      latitude: 10.0,
      child: Image.asset('assets/images/360_images/Entrance1.webp'),
      hotspots: [
        Hotspot(
          longitude: 159.14751478907584,
          latitude: 6.619360556364552,
          width: 90,
          height: 85,
          widget: hotspotButton(
              text: "Let's Explore",
              icon: Icons.open_in_browser,
              onPressed: () => setState(() => _panoId = 1)),
        ),
        Hotspot(
          longitude: -9.3,
          latitude: 7.3,
          width: 60.0,
          height: 60.0,
          widget: hotspotButton(
              icon: Icons.search,
              onPressed: () { maslaoutside(context);
              }
              )
        ),
      ],
    );
  }

  PanoramaViewer _entrance2() {
    return PanoramaViewer(
      // animSpeed: 2.0,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,
      longitude: -112.0,
      latitude: 20.8 ,
      onTap: (longitude, latitude, tilt) =>
          print('onTap: $longitude, $latitude, $tilt'),
      child: Image.asset('assets/images/360_images/Entrance2.webp'),
      hotspots: [
        Hotspot(
          longitude: -107.65,
          latitude: 2.0,
          width: 85.0,
          height: 85.0,
          widget: hotspotButton(
              text: "Enter",
              icon: Icons.door_sliding_outlined,
              onPressed: () => setState(() => _panoId = 11)),
        ),
        Hotspot(
          longitude: 97.4,
          latitude: 4.7,
          width: 60.0,
          height: 60.0,
          widget: hotspotButton(
              icon: Icons.arrow_upward,
              onPressed: () => setState(() => _panoId--)),
        ),
      ],
    );
  }

  // Grandhall
  PanoramaViewer _grandhall1() {
    return PanoramaViewer(
      // animSpeed: 0.0,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,
      child: Image.asset('assets/images/360_images/1.webp'),
      hotspots: [
        Hotspot(
            longitude: 160.4,
            latitude: -0.9,
            width: 100,
            height: 85,
            widget: hotspotButton(
              text: "Go out",
              icon: Icons.exit_to_app,
              onPressed: () {
                final int newIndex = _imageMap['entrance1']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            longitude: -58.7,
            latitude: -4.2,
            width: 100,
            height: 85,
            widget: hotspotButton(
              icon: Icons.arrow_upward_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall2']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
          longitude: -26.6,
          latitude: -2.3,
          width: 100,
          height: 85,
          widget: hotspotButton(
              icon: Icons.arrow_upward_outlined,
              onPressed: () => setState(() => _panoId = 6)), // 3.1
        ),
        Hotspot(
            longitude: 2.7,
            latitude: -6.4,
            width: 60,
            height: 60,
            widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall5']!;
                setState(() => _panoId = newIndex);
              },
            ) // 5
            ),
        Hotspot(
            longitude: 35.0,
            latitude: -3.0,
            width: 48,
            height: 48,
            widget: hotspotButton(
              icon: Icons.arrow_upward_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall6']!;
                setState(() => _panoId = newIndex);
              },
            ) // 5
            ),
      ],
    );
  }

  PanoramaViewer _grandhall2() {
    return PanoramaViewer(
      // animSpeed: 1.0,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,

      child: Image.asset('assets/images/360_images/2.1.webp'),
      hotspots: [
        Hotspot(
            // to Entrance2.webp
            longitude: -109.0,
            latitude: -19.6,
            width: 100,
            height: 85,
            widget: hotspotButton(
              text: "Go out",
              icon: Icons.exit_to_app,
              onPressed: () {
                final int newIndex = _imageMap['entrance2']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            // to 2.3.webp
            longitude: 15.9,
            latitude: -20.1,
            width: 60,
            height: 60,
            widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall2_2']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            // To 5.webp
            longitude: -172.16,
            latitude: -33.4,
            width: 60,
            height: 60,
            widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall5']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            // To 5.webp
            longitude: -110.5,
            latitude: -41.1,
            width: 60,
            height: 60,
            widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall1']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            // to 3.1.webp
            longitude: 104.1,
            latitude: -36.2,
            width: 60,
            height: 60,
            widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall3']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            // to 4.webp
            longitude: 109.6,
            latitude: -23.4,
            width: 48,
            height: 48,
            widget: hotspotButton(
              icon: Icons.arrow_upward_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall4']!;
                setState(() => _panoId = newIndex);
              },
            )),
      ],
    );
  }

  PanoramaViewer _grandhall2_2() {
    return PanoramaViewer(
      // animSpeed: 1.0,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,
      onTap: (longitude, latitude, tilt) =>
          print('onTap: $longitude, $latitude, $tilt'),
      child: Image.asset('assets/images/360_images/2.2.webp'),
      hotspots: [
        Hotspot( // Libsync
          longitude: -138.2,
          latitude: -17.6,
          width: 60,
          height: 60,
          widget: hotspotButton(
              icon: Icons.search_outlined,
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => LibSyncPage(
              //           text: "Senusret I was a powerful pharaoh of ancient Egypt during the Middle Kingdom (around 1971-1926 BCE). He led military campaigns into Nubia, undertook extensive building projects (including the White Chapel at Karnak), and implemented administrative reforms that strengthened Egypt's central authority. His reign marked a period of stability and prosperity in Egyptian history, contributing significantly to the kingdom's cultural and economic development.",
              //           video: 'assets/videos/Libsync/Senusrt_I.mp4',
              //           title: 'Senusrt The First',
              //           languageCode: 'en',
              //           panoId: 0,
              //         )));
            },
          ),
        ),
        Hotspot(
          longitude: 39.2,
          latitude: -38.7,
          width: 85,
          height: 85,
          widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () => setState(() => _panoId = 4)), // Back to 2.1
        ),
        Hotspot(
          longitude: -124.3,
          latitude: -13.5,
          width: 85,
          height: 85,
          widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () => setState(() => _panoId = 9)), // to 2.3
        ),
      ],
    );
  }

  PanoramaViewer _grandhall2_3() {
    return PanoramaViewer(

      child: Image.asset('assets/images/360_images/2.3.webp'),
      hotspots: [
        Hotspot(
          longitude: 37.7,
          latitude: -32.6,
          width: 50,
          height: 50,
          widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () => setState(() => _panoId = 5)), //Back to 2.2
        ),
        Hotspot(
          longitude: 33.7,
          latitude: -20.0,
          width: 50,
          height: 50,
          widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () => setState(() => _panoId = 4)), // To 2.1
        ),
        Hotspot(
          longitude: -158,
          latitude: -7.9,
          width: 50,
          height: 50,
          widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () => setState(() => _panoId = 10)), // To 2.4
        ),
      ],
    );
  }

  PanoramaViewer _grandhall2_4() {
    return PanoramaViewer(

        child: Image.asset('assets/images/360_images/2.4.webp'),
        hotspots: [
          Hotspot(
            longitude: -5.4,
            latitude: -32.1,
            width: 50,
            height: 50,
            widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () => setState(() => _panoId = 9)), //Back to 2.3
          ),
          Hotspot(
            longitude: -5.6,
            latitude: -21.2,
            width: 48,
            height: 48,
            widget: hotspotButton(
                icon: Icons.arrow_circle_up_outlined,
                onPressed: () => setState(() => _panoId = 4)), //Back to 2.1
          ),
          Hotspot(
            longitude: -102.0,
            latitude: -7.9,
            width: 80,
            height: 80,
            widget: hotspotButton(
                icon: Icons.arrow_circle_up_outlined,
                onPressed: () => setState(() => _panoId = 7)), //to 3.3
          ),
        ]);
  }

  PanoramaViewer _grandhall3() {
    return PanoramaViewer(
      // animSpeed: 1.0,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,

      child: Image.asset('assets/images/360_images/3.1.webp'),
      hotspots: [
        Hotspot(
          longitude: -92.3,
          latitude: -8.6,
          width: 100,
          height: 85,
          widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () => setState(() => _panoId = 4)),
        ),
        Hotspot(
          longitude: -5.6,
          latitude: 2.7,
          width: 48,
          height: 48,
          widget: hotspotButton(
              icon: Icons.arrow_upward_rounded,
              onPressed: () => setState(() => _panoId = 7)),
        ),
        Hotspot(
            longitude: 86.8,
            latitude: -8.0,
            width: 60,
            height: 60,
            widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall4']!;
                setState(() => _panoId = newIndex);
              },
            )),
      ],
    );
  }

  PanoramaViewer _grandhall3_3() {
    return PanoramaViewer(

      child: Image.asset('assets/images/360_images/3.3.webp'),
      hotspots: [
        Hotspot(
          longitude: 129.5,
          latitude: -7.0,
          width: 50,
          height: 50,
          widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () => setState(() => _panoId = 6)), //Back to 3.1
        ),
        Hotspot(
          longitude: -8.0,
          latitude: 2.0,
          width: 50,
          height: 50,
          widget: hotspotButton(
              icon: Icons.arrow_forward,
              onPressed: () => setState(() => _panoId = 8)), // To 3.4
        ),
        Hotspot(
          longitude: -133.4,
          latitude: -6.7,
          width: 50,
          height: 50,
          widget: hotspotButton(
              icon: Icons.arrow_circle_up_outlined,
              onPressed: () => setState(() => _panoId = 10)), // To 2.4
        ),
      ],
    );
  }

  PanoramaViewer _grandhall3_4() {
    return PanoramaViewer(

        child: Image.asset('assets/images/360_images/3.4.webp'),
        hotspots: [
          Hotspot(
            longitude: -99.0,
            latitude: -8.3,
            width: 50,
            height: 50,
            widget: hotspotButton(
                icon: Icons.arrow_circle_left_outlined,
                onPressed: () => setState(() => _panoId--)), //Back to 3.3
          ),
          Hotspot(
              longitude: 124.2,
              latitude: 4.7,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Go Down',
                icon: Icons.arrow_circle_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 80.5,
              latitude: -20.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['_staircase4_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 42.3,
              latitude: -8.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['_staircase4_2_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 103.8,
              latitude: 7.5,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Go Up',
                icon: Icons.arrow_circle_left_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _grandhall4() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.webp'),
        hotspots: [
          Hotspot(
              longitude: -6.2,
              latitude: -10.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -113.1,
              latitude: -17.3,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -106.5,
              latitude: -10.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -170.6,
              latitude: -20.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall8']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 134.8,
              latitude: -21.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall9']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _grandhall5() {
    return PanoramaViewer(
      // animSpeed: 0.0,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,

      child: Image.asset('assets/images/360_images/5.webp'),
      hotspots: [
        Hotspot(
            longitude: -120.4,
            latitude: -0.2,
            width: 100,
            height: 85,
            widget: hotspotButton(
              text: "Go out",
              icon: Icons.exit_to_app,
              onPressed: () {
                final int newIndex = _imageMap['entrance2']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            longitude: -98.0,
            latitude: -12.2,
            width: 100,
            height: 85,
            widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall1']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            longitude: -25.6,
            latitude: -4.3,
            width: 100,
            height: 85,
            widget: hotspotButton(
              icon: Icons.arrow_upward_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall2']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            longitude: 103.16,
            latitude: 4.3,
            width: 48,
            height: 48,
            widget: hotspotButton(
              icon: Icons.arrow_upward_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall7']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            longitude: 64.1,
            latitude: -0.3,
            width: 48,
            height: 48,
            widget: hotspotButton(
              icon: Icons.arrow_upward_rounded,
              onPressed: () {
                final int newIndex = _imageMap['grandhall8']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            longitude: 125.00,
            latitude: -0.9,
            width: 60,
            height: 60,
            widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall6']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
          longitude: 97.4,
          latitude: 23.7,
          width: 48,
          height: 48,
          widget: hotspotButton(
            icon: Icons.search,
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => LibSyncPage(
              //               text: 'Greetings, esteemed visitors! I am Ramesses II, the great pharaoh of Egypt. I am honored to welcome you to this magnificent museum, where you can learn about the rich history and culture of my people.',
              //               video: 'assets/videos/Libsync/Ramses_II.mp4',
              //               title: 'Ramesses-II welcoming you!',
              //           languageCode: 'en', // Replace with the actual language code
              //           panoId: 1,
              //             )));
            },
          ),
        ),
      ],
    );
  }

  PanoramaViewer _grandhall6() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/6.webp'),
        hotspots: [
          Hotspot(
              longitude: 55.8,
              latitude: -4.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall5']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 35.7,
              latitude: -5.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall1']!;
                  setState(() => _panoId = newIndex);
                },
              ) // 5
              ),
          Hotspot(
              longitude: -176.4,
              latitude: -5.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall7']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 158.2,
              latitude: -1.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall8']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _grandhall7() {
    return PanoramaViewer(
      animSpeed: 1.0,
      // sensorControl: SensorControl.orientation,
      onViewChanged: onViewChanged,
      child: Image.asset('assets/images/360_images/7.webp'),
      hotspots: [
        Hotspot(
          longitude: -92.3,
          latitude: -8.6,
          width: 100,
          height: 85,
          widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () => setState(() => _panoId = 2)),
        ),
        Hotspot(
            // To image 8
            longitude: 17.0,
            latitude: -14.7,
            width: 48,
            height: 48,
            widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall8']!;
                setState(() => _panoId = newIndex);
              },
            )),
        Hotspot(
            // to image 9
            longitude: 34.0,
            latitude: -9.6,
            width: 48,
            height: 48,
            widget: hotspotButton(
              icon: Icons.circle_outlined,
              onPressed: () {
                final int newIndex = _imageMap['grandhall9']!;
                setState(() => _panoId = newIndex);
              },
            )),
      ],
    );
  }

  PanoramaViewer _grandhall8() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/8.webp'),
        hotspots: [
          Hotspot(
              longitude: -61.9,
              latitude: -4.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall5']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -99.4,
              latitude: -6.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall6']!;
                  setState(() => _panoId = newIndex);
                },
              ) // 5
              ),
          Hotspot(
              longitude: -121.8,
              latitude: -8.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall7']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 111.0,
              latitude: -9.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall9']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 3.3,
              latitude: -2.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _grandhall9() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/9.webp'),
        hotspots: [
          Hotspot(
              longitude: 169.8,
              latitude: -7.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall6']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -108.8,
              latitude: -7.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall4']!;
                  setState(() => _panoId = newIndex);
                },
              ) // 5
              ),
          Hotspot(
              longitude: -141.3,
              latitude: -2.68,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 70.5,
              latitude: -0.9,
              width: 100,
              height: 85,
              widget: hotspotButton(
                text: "Restaurants",
                icon: Icons.restaurant_rounded,
                onPressed: () {},
              )),
        ]);
  }

  // Grand Staircase
  PanoramaViewer _staircase4_1_1_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        //   sensorControl: SensorControl.orientation,
        //   onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.1.1.1.webp'),
        hotspots: [
          Hotspot(
              // Go back to 3.1
              longitude: -145.5,
              latitude: -11.3,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // move to 4_1_1_2
              longitude: -23.3,
              latitude: 3.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Go up to 4-1-1-2
              longitude: -81.5,
              latitude: -7.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Go back
              longitude: 176.6,
              latitude: -22.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall4']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Libsync Senusrt III
              longitude: -67.6,
              latitude: 9.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LibSyncPage(
                  //           text: "Senusret III was a Pharaoh of Egypt who reigned from 1878 to 1839 BC. He was the son of Senusret II and succeeded him as Pharaoh. During his reign, he focused on strengthening Egypt's economy and military, and he also launched several successful military campaigns. He was known for his wisdom and justice, and his reign is often referred to as the 'Golden Age' of the 12th dynasty.",
                  //           video: 'assets/videos/Libsync/Senusrt_III.mp4',
                  //           title: 'Senusrt III',
                  //           languageCode: 'en', // Replace with the actual language code
                  //           panoId: 2,
                  //         )
                  //     )
                  // );
                },
              ),
          ),
          Hotspot(
              // Libsync 2
              longitude: -61.1,
              latitude: 17.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              // Black - IDK
              longitude: -3.1,
              latitude: 17.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              // No name
              longitude: -94.9,
              latitude: 13.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_1_1_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.1.1.2.webp'),
        hotspots: [
          Hotspot(
              longitude: 162.1,
              latitude: -18.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall4']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -133.3,
              latitude: -17.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_forward,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -81.5,
              latitude: -7.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -6.0,
              latitude: -14.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 93.3,
              latitude: -22.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_1_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,
        child: Image.asset('assets/images/360_images/4.1.2.webp'),
        hotspots: [
          Hotspot(
              // Exit to 4
              longitude: 169.0,
              latitude: -5.7,
              width: 100,
              height: 100,
              widget: hotspotButton(
                text: 'Grand Hall',
                icon: Icons.exit_to_app,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall4']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Up to 3_1
              longitude: -23.3,
              latitude: 3.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down to 1_1
              longitude: 168.9,
              latitude: -19.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Libsync حتشبسوت
              longitude: -75.8,
              latitude: 24.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              // Libsync امنحتب التالت
              longitude: -117.2,
              latitude: 12.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LibSyncPage(
                  //           text: "Amenhotep III was a prominent pharaoh of ancient Egypt during the New Kingdom (around 1386-1353 BCE). He focused on diplomacy rather than military conquests, maintaining peace and prosperity through strategic alliances. Amenhotep III oversaw extensive building projects, including the Temple of Luxor and the Colossi of Memnon. His reign marked a golden age of artistic achievement, with remarkable sculptures and architecture reflecting Egypt's wealth and power. He left a legacy of cultural richness and diplomatic success, contributing to Egypt's prominence in the ancient world.",
                  //           video: 'assets/videos/Libsync/Amenhotep_III.mp4',
                  //           title: 'Amenhotep The Third',
                  //           languageCode: 'en', // Replace with the actual language code
                  //           panoId: 3,
                  //         )));
                },
              ),
          ),
          Hotspot(
            // Libsync تحتمس التالت
            longitude: -46.5,
            latitude: 17.9,
            width: 48,
            height: 48,
            widget: hotspotButton(
              icon: Icons.search,
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LibSyncPage(
                //           text: "Thutmose III was a powerful pharaoh of ancient Egypt during the New Kingdom (around 1479-1425 BCE). He was renowned for his military campaigns, which expanded Egypt's empire into Canaan and Syria, greatly increasing its wealth and influence. Thutmose III also supported artistic and architectural projects, leaving a legacy of territorial expansion and cultural advancement that strengthened Egypt's prominence in the ancient world.",
                //           video: 'assets/videos/Libsync/Thutmose_III.mp4',
                //           title: 'Thutmose The Third',
                //           languageCode: 'en', // Replace with the actual language code
                //           panoId: 4,
                //         )));
              },
            ),
          ),
          Hotspot(
              // Unknown
              longitude: -141.2,
              latitude: 10.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              // Libsync اخناتون
              longitude: 5.8,
              latitude: 3.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_1_3_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.1.3.1.webp'),
        hotspots: [
          Hotspot(
              // move behind Statue (3_2)
              longitude: 126.7,
              latitude: -11.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down to 2
              longitude: 44.1,
              latitude: -14.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Go upstairs Level 2
              longitude: -136.0,
              latitude: -1.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Unknown
              longitude: 164.2,
              latitude: 13.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              // Libsymc تحتمس
              longitude: 96.6,
              latitude: -0.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LibSyncPage(
                  //           text: "Thutmose III was a powerful pharaoh of ancient Egypt during the New Kingdom (around 1479-1425 BCE). He was renowned for his military campaigns, which expanded Egypt's empire into Canaan and Syria, greatly increasing its wealth and influence. Thutmose III also supported artistic and architectural projects, leaving a legacy of territorial expansion and cultural advancement that strengthened Egypt's prominence in the ancient world.",
                  //           video: 'assets/videos/Libsync/Thutmose_III.mp4',
                  //           title: 'Thutmose The Third',
                  //           languageCode: 'en', // Replace with the actual language code
                  //           panoId: 5,
                  //         )));
                },
              ),
          ),
          Hotspot(
              // Libsync اخناتون
              longitude: -15.1,
              latitude: -6.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_1_3_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,
        
        child: Image.asset('assets/images/360_images/4.1.3.2.webp'),
        hotspots: [
          Hotspot(
              longitude: 82.6,
              latitude: -16.5,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -21.1,
              latitude: 2.3,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Level 2',
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3_4']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 167.7,
              latitude: -27.1,
              width: 50,
              height: 50,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  // Level 2
  PanoramaViewer _staircase4_2_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.2.1.webp'),
        hotspots: [
          Hotspot(
              // to GrandHall 3_4
              longitude: 140.2,
              latitude: -12.2,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3_4']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // to GrandHall 3_3
              longitude: 172.3,
              latitude: -9.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3_3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down right
              longitude: 89.7,
              latitude: -4.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down left
              longitude: 62.2,
              latitude: -1.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Next to this point
              longitude: -86.5,
              latitude: -37.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // to 4_2_2_1
              longitude: 12.2,
              latitude: -6.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // to 4_2_3_2
              longitude: -90.0,
              latitude: -10.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_2_2_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.2.2.1.webp'),
        hotspots: [
          Hotspot(
              longitude: -43.7,
              latitude: -8.5,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.turn_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -63.5,
              latitude: -10.7,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 52.2,
              latitude: -10.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 123.8,
              latitude: -1.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 148.9,
              latitude: -2.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_2_2_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.2.2.2.webp'),
        hotspots: [
          Hotspot(
              longitude: -56.6,
              latitude: -26.4,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -49.6,
              latitude: -13.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -154.0,
              latitude: -6.8,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 71.2,
              latitude: -4.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_2_3_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.2.3.1.webp'),
        hotspots: [
          Hotspot(
              longitude: 129.9,
              latitude: -13.9,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -155.3,
              latitude: -17.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -87.4,
              latitude: -14.5,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.turn_slight_left_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -19.0,
              latitude: 4.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_4_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_2_3_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,
        child: Image.asset('assets/images/360_images/4.2.3.2.webp'),
        hotspots: [
          Hotspot(
              longitude: 161.8,
              latitude: -12.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 163.5,
              latitude: -26.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 179.8,
              latitude: -11.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['grandhall3_4']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 45.7,
              latitude: -26.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -59.3,
              latitude: -12.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_2_4_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.2.4.1.webp'),
        hotspots: [
          Hotspot(
              // To Level 3
              longitude: -33.3,
              latitude: 2.6,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Level 3',
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Behind Statue
              longitude: -101.0,
              latitude: -6.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_left_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down to 4_2_3_1
              longitude: 145.5,
              latitude: -20.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down to 4_2_3_1
              longitude: -177.7,
              latitude: -15.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_1_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_2_4_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.2.4.2.webp'),
        hotspots: [
          Hotspot(
              // Down to Right
              longitude: -35.3,
              latitude: -12.3,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down all the way to 4_2_2_2
              longitude: -35.2,
              latitude: -3.6,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down to Left
              longitude: -70.9,
              latitude: -3.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Behind pyramid
              longitude: -114.8,
              latitude: -0.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_4_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // up to Level 3
              longitude: 141.0,
              latitude: 8.7,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Level 3',
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  // Level 3
  PanoramaViewer _staircase4_3_1_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.1.1.webp'),
        hotspots: [
          Hotspot(
              // Behind statue
              longitude: -57.8,
              latitude: -7.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_left_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Go up
              longitude: -11.6,
              latitude: -3.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Go Down
              longitude: -174.7,
              latitude: -12.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_4_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_3_1_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.1.2.webp'),
        hotspots: [
          Hotspot(
              longitude: 128.9,
              latitude: -1.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Up to 4_3_2_1 (Right)
              longitude: 62.7,
              latitude: -3.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Up to 4_3_2_2 (Left)
              longitude: 4.0,
              latitude: -6.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Go down to 4.2.4.2
              longitude: -161.3,
              latitude: -11.7,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Go Down',
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_2_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              //تابوت
              longitude: 164.7,
              latitude: -14.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              //مسله صغننه
              longitude: 91.0,
              latitude: -18.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              //حاجه مجوفه
              longitude: 108.0,
              latitude: -9.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
          Hotspot(
              //تلات شباب وجوزين
              longitude: 23.0,
              latitude: -9.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_3_2_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.2.1.webp'),
        hotspots: [
          Hotspot(
              // Behind Statue
              longitude: 17.7,
              latitude: -9.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_left_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Down to 4_3_1_1
              longitude: -122.2,
              latitude: -12.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              // Go up
              longitude: 52.2,
              latitude: -10.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -81.0,
              latitude: -12.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 1.6,
              latitude: -18.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_3_2_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.2.2.webp'),
        hotspots: [
          Hotspot(
              // Go up
              longitude: -128.1,
              latitude: -17.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -24.8,
              latitude: -9.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 62.7,
              latitude: -11.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -0.0,
              latitude: -17.5,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search_outlined,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_3_3_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.3.1.webp'),
        hotspots: [
          Hotspot(
              longitude: 64.8,
              latitude: 6.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_4_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -11.3,
              latitude: -9.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -120.7,
              latitude: -28.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_2_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -122.1,
              latitude: -14.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_3_3_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.3.2.webp'),
        hotspots: [
          Hotspot(
              longitude: -8.6,
              latitude: -14.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -103.9,
              latitude: -9.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 61.2,
              latitude: -24.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_2_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 71.2,
              latitude: -13.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_3_4_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.4.1.webp'),
        hotspots: [
          Hotspot(
              longitude: -39.3,
              latitude: -2.6,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Level 4',
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 131.7,
              latitude: -20.4,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_3_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -117.7,
              latitude: -16.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_right_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 132.0,
              latitude: -9.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_rounded,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_3_4_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.3.4.2.webp'),
        hotspots: [
          Hotspot(
              longitude: -30.3,
              latitude: -21.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 98.3,
              latitude: -8.7,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_left,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_4_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 151.8,
              latitude: -24.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_3_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  // Level 4
  PanoramaViewer _staircase4_4_1_1() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.4.1.1.webp'),
        hotspots: [
          Hotspot(
              longitude: -111.0,
              latitude: -21.6,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_4_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -9.4,
              latitude: -13.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 46.1,
              latitude: -11.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.turn_slight_left,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot( // Go upstairs
              longitude: 55.3,
              latitude: -0.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_4_1_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.4.1.2.webp'),
        hotspots: [
          Hotspot(
              longitude: -83.4,
              latitude: -4.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -168.9,
              latitude: -5.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -177.6,
              latitude: 9.8,
              width: 50,
              height: 76,
              widget: hotspotButton(
                text: 'Go up',
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -18.2,
              latitude: -20.1,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_3_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -148.9,
              latitude: -2.9,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_4_2() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.4.2.webp'),
        hotspots: [
          Hotspot(
              longitude: 33.0,
              latitude: -10.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: -109.1,
              latitude: 7.5,
              width: 60,
              height: 60,
              widget: hotspotButton(
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 104.8,
              latitude: -8.3,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.search,
                onPressed: () {},
              )),
        ]);
  }

  PanoramaViewer _staircase4_4_3() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.4.3.webp'),
        hotspots: [
          Hotspot(
              longitude: -117.9,
              latitude: 10.9,
              width: 90,
              height: 90,
              widget: hotspotButton(
                text: 'Go upstairs',
                icon: Icons.arrow_upward_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_5']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 72.0,
              latitude: -19.2,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 97.1,
              latitude: -5.0,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_1_2']!;
                  setState(() => _panoId = newIndex);
                },
              )),
          Hotspot(
              longitude: 57.4,
              latitude: -7.8,
              width: 48,
              height: 48,
              widget: hotspotButton(
                icon: Icons.circle_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_1_1']!;
                  setState(() => _panoId = newIndex);
                },
              )),
        ]);
  }

  PanoramaViewer _staircase4_5() {
    return PanoramaViewer(
        // animSpeed: 0.0,
        // sensorControl: SensorControl.orientation,
        onViewChanged: onViewChanged,

        child: Image.asset('assets/images/360_images/4.5.webp'),
        hotspots: [
          Hotspot(
              // Go down to 4_4_3
              longitude: 176.6,
              latitude: 4.0,
              width: 80,
              height: 80,
              widget: hotspotButton(
                text: 'Go Down',
                icon: Icons.stairs_outlined,
                onPressed: () {
                  final int newIndex = _imageMap['staircase4_4_3']!;
                  setState(() => _panoId = newIndex);
                },
              )),
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
        ]);
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoImages.length) {
      case 0: // Entrance 1
        panorama = _entrance1();
        break;
      case 1: // Entrance 2
        panorama = _entrance2();
        break;
      case 2: // image 5
        panorama = _grandhall5();
        break;
      case 3: // image 7
        panorama = _grandhall7();
        break;
      case 4: // image 2.1
        panorama = _grandhall2();
        break;
      case 5: // image 2.2
        panorama = _grandhall2_2();
        break;
      case 6: // image 3.1
        panorama = _grandhall3();
        break;
      case 7: // Image 3.3
        panorama = _grandhall3_3();
        break;
      case 8: // Image 3.4
        panorama = _grandhall3_4();
        break;
      case 9: // Image 2.3
        panorama = _grandhall2_3();
        break;
      case 10: // Image 2.4
        panorama = _grandhall2_4();
        break;
      case 11: // image 1
        panorama = _grandhall1();
        break;
      case 12: // image 4
        panorama = _grandhall4();
        break;
      case 13: // image 6
        panorama = _grandhall6();
        break;
      case 14: // image 8
        panorama = _grandhall8();
        break;
      case 15: // image 9
        panorama = _grandhall9();
        break;
      case 16: // Grand Staircase Level 1
        panorama = _staircase4_1_1_1();
        break;
      case 17: // image 4.1.1.2
        panorama = _staircase4_1_1_2();
        break;
      case 18: // image 4.1.2
        panorama = _staircase4_1_2();
        break;
      case 19: // image 4.1.3.1
        panorama = _staircase4_1_3_1();
        break;
      case 20: // image 4.1.3.2
        panorama = _staircase4_1_3_2();
        break;
      case 21: // Level 2
        panorama = _staircase4_2_1();
        break;
      case 22: // image 4.2.2.1
        panorama = _staircase4_2_2_1();
        break;
      case 23: // image 4.2.2.2
        panorama = _staircase4_2_2_2();
        break;
      case 24: // image 4.2.3.1
        panorama = _staircase4_2_3_1();
        break;
      case 25: // image 4.2.3.2
        panorama = _staircase4_2_3_2();
        break;
      case 26: // image 4_2_4_1
        panorama = _staircase4_2_4_1();
        break;
      case 27: // image 4_2_4_2
        panorama = _staircase4_2_4_2();
        break;
      case 28: // image 4_3_1_1
        panorama = _staircase4_3_1_1();
        break;
      case 29: // image 4_3_1_2
        panorama = _staircase4_3_1_2();
        break;
      case 30: // image 4_3_2_1
        panorama = _staircase4_3_2_1();
        break;
      case 31: // image 4_3_2_2
        panorama = _staircase4_3_2_2();
        break;
      case 32: // image 4_3_3_1
        panorama = _staircase4_3_3_1();
        break;
      case 33: // image 4_3_3_2
        panorama = _staircase4_3_3_2();
        break;
      case 34: // image 4_3_4_1
        panorama = _staircase4_3_4_1();
        break;
      case 35: // image 4_3_4_2
        panorama = _staircase4_3_4_2();
        break;
      case 36: // image 4_4_1_1
        panorama = _staircase4_4_1_1();
        break;
      case 37: // image 4_4_1_2
        panorama = _staircase4_4_1_2();
        break;
      case 38: // image 4_4_2
        panorama = _staircase4_4_2();
        break;
      case 39: // image 4_4_3
        panorama = _staircase4_4_3();
        break;
      case 40: // image 4_5
        panorama = _staircase4_5();
        break;

      default:
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          // sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          child: panoImages[_panoId % panoImages.length],
          hotspots: [
            Hotspot(
              latitude: 0.0,
              longitude: 160.0,
              width: 90.0,
              height: 75.0,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.double_arrow,
                  onPressed: () => setState(() => _panoId--)),
            ),
          ],
        );
    }
    return Scaffold(
      body: Stack(
        children: [
          panorama,
          Text('')
          // // Text(
          // //     'Longitude: ${_lon.toStringAsFixed(2)}, Latitude: ${_lat.toStringAsFixed(2)}, Tilt: ${_tilt.toStringAsFixed(2)}'),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   mini: true,
      //   onPressed: () async {
      //     final pickedFile = await picker.getImage(source: ImageSource.gallery);
      //     setState(() {
      //       if (pickedFile != null) {
      //         panoImages.add(Image.file(File(pickedFile.path)));
      //         _panoId = panoImages.length - 1;
      //       }
      //     });
      //   },
      //   child: Icon(Icons.panorama),
      // ),
    );
  }
}

void pyramidview(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text('Pyramid View'),
        contentPadding: EdgeInsets.all(7.0), // Reduce padding
        content: Image.asset('assets/images/artifacts/pyramid_view.png'),
      );
    },
  );
}
void maslaoutside(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text('Entrance View'),


        // Need to edit so it supports multilingual from the settings at home page:


        contentPadding: EdgeInsets.all(7.0), // Reduce padding
        title: Text('المسلة المعلقة للملك رمسيس الثاني'),
        scrollable: true,
        content: Title(title: 'Masala_Outside', color: Colors.white,child: Text('تم اكتشافها في مكان اسمه صهر الحجر ف الشرقيه حاليا مقسمة إلى عدة أجزاء وهى منحوتة من حجر الجرانيت الوردي وتتميز بجمال نقوشها التى تصور الملك رمسيس الثانى، واقفا أمام أحد المعبودات، بالإضافة إلى الألقاب المختلفة له.'
      ),),
        // Text('Senusret'),
        // content: Image.asset('assets/images/artifacts/masla-outside.png'),
      );
    },
  );
}

