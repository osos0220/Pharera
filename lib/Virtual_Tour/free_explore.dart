// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Tour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Free Explore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class PanoramaPage extends StatelessWidget {
//   final String imageUrl;
//
//   const PanoramaPage({super.key, required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Panorama'),
//       ),
//       body: Center(
//         child: Image.network(
//           imageUrl,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

class _MyHomePageState extends State<MyHomePage> {
  int _panoId = 0;
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  List<Image> panoImages = [
    Image.asset('assets/images/360_images/Entrance1.jpg'),
    Image.asset('assets/images/360_images/Entrance2.jpg'),
    Image.asset('assets/images/360_images/2.1.jpg'),
    Image.asset('assets/images/360_images/2.2.jpg'),
    Image.asset('assets/images/360_images/2.3.jpg'),
    Image.asset('assets/images/360_images/2.4.jpg'),
    Image.asset('assets/images/360_images/3.1.jpg'),
    Image.asset('assets/images/360_images/3.3.jpg'),
    Image.asset('assets/images/360_images/3.4.jpg'),
    Image.asset('assets/images/360_images/5.jpg'),
    Image.asset('assets/images/360_images/7.jpg'),

  ];
  ImagePicker picker = ImagePicker();

  void onViewChanged(longitude, latitude, tilt) {
    setState(() {
      _lon = longitude;
      _lat = latitude;
      _tilt = tilt;
    });
  }

  Widget hotspotButton(
      {String? text, IconData? icon, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Icon(icon),
          onPressed: onPressed,
        ),
        text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoImages.length) {
      case 0: // Entrance 1
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/Entrance1.jpg'),
          hotspots: [
            Hotspot(
              longitude: 159.14751478907584,
              latitude: 6.619360556364552,
              width: 90,
              height: 85,
              widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.open_in_browser,
                  onPressed: () => setState(() => _panoId = 1)),
            ),
            Hotspot(
              longitude: 150.0,
              latitude: -42.0,
              width: 60.0,
              height: 60.0,
              widget: hotspotButton(
                  icon: Icons.search,
                  onPressed: () => setState(() => _panoId--)),
            ),
            // Hotspot(
            //   latitude: -33.0,
            //   longitude: 123.0,
            //   width: 60.0,
            //   height: 60.0,
            //   widget: hotspotButton(icon: Icons.arrow_upward, onPressed: () {}),
            // ),
          ],
        );
        break;
      case 1: // Entrance 2
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/Entrance2.jpg'),
          hotspots: [
            Hotspot(
              longitude: -107.65,
              latitude: 2.0,
              width: 85.0,
              height: 85.0,
              widget: hotspotButton(
                  text: "Enter",
                  icon: Icons.door_sliding_outlined,
                  onPressed: () => setState(() => _panoId = 2)),
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
        break;
      case 2: // image 5
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/5.jpg'),
          hotspots: [
            Hotspot(
              longitude: -120.4,
              latitude: -0.2,
              width: 100,
              height: 85,
              widget: hotspotButton(
                  text: "Go out",
                  icon: Icons.exit_to_app,
                  onPressed: () => setState(() => _panoId--)),
            ),
            Hotspot(
              longitude: -25.6,
              latitude: -4.3,
              width: 100,
              height: 85,
              widget: hotspotButton(
                  icon: Icons.arrow_upward_outlined,
                  onPressed: () => setState(() => _panoId = 4)),
            ),
            Hotspot(
              longitude: 103.16,
              latitude: 4.3,
              width: 60,
              height: 60,
              widget: hotspotButton(
                  icon: Icons.circle_outlined,
                  onPressed: () => setState(() => _panoId = 3)),
            ),
          ],
        );
        break;
      case 3: // image 7
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/7.jpg'),
          hotspots: [
            Hotspot(
              longitude: -92.3,
              latitude: -8.6,
              width: 100,
              height: 85,
              widget: hotspotButton(
                  icon: Icons.circle_outlined,
                  onPressed: () => setState(() => _panoId = 2)),
            )
          ],
        );
        break;
      case 4: // image 2.1
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/2.1.jpg'),
          hotspots: [
            Hotspot(
              // to Entrance2.jpg
              longitude: -109.0,
              latitude: -19.6,
              width: 100,
              height: 85,
              widget: hotspotButton(
                  text: "Go out",
                  icon: Icons.exit_to_app,
                  onPressed: () => setState(() => _panoId = 1)),
            ),
            Hotspot(
              // to 2.3.jpg
              longitude: 15.9,
              latitude: -20.1,
              width: 60,
              height: 60,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_outlined,
                  onPressed: () => setState(() => _panoId = 5)),
            ),
            Hotspot(
              // To 5.jpg
              longitude: -172.16,
              latitude: -33.4,
              width: 60,
              height: 60,
              widget: hotspotButton(
                  icon: Icons.arrow_circle_up_outlined,
                  onPressed: () => setState(() => _panoId = 2)),
            ),
            Hotspot(
              // to 3.1.jpg
              longitude: 107.0,
              latitude: -27.4,
              width: 60,
              height: 60,
              widget: hotspotButton(
                  icon: Icons.circle_outlined,
                  onPressed: () => setState(() => _panoId = 6)),
            ),
          ],
        );
        break;
      case 5: // image 2.2
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/2.2.jpg'),
          hotspots: [
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
        break;
      case 6: // image 3.1
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
          onViewChanged: onViewChanged,
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/3.1.jpg'),
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
              width: 60,
              height: 60,
              widget: hotspotButton(
                  icon: Icons.circle_outlined,
                  onPressed: () => setState(() => _panoId = 7)),
            )
          ],
        );
        break;
      case 7: // Image 3.3
        panorama = PanoramaViewer(
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/3.3.jpg'),
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
        break;
      case 8: // Image 3.4
        panorama = PanoramaViewer(
            onTap: (longitude, latitude, tilt) =>
                print('onTap: $longitude, $latitude, $tilt'),
            child: Image.asset('assets/images/360_images/3.4.jpg'),
            hotspots: [
              Hotspot(
                longitude: -99.0,
                latitude: -8.3,
                width: 50,
                height: 50,
                widget: hotspotButton(
                    icon: Icons.arrow_circle_left_outlined,
                    onPressed: () => setState(() => _panoId --)), //Back to 3.3
              ),
              Hotspot(
                longitude: 124.2,
                latitude: 4.7,
                width: 80,
                height: 80,
                widget: hotspotButton(
                  text: 'Go Down',
                    icon: Icons.arrow_circle_right_outlined,
                    onPressed: () => setState(() => _panoId --)), //to 4.1
              ),
            ]);
      case 9: // Image 2.3
        panorama = PanoramaViewer(
          onTap: (longitude, latitude, tilt) =>
              print('onTap: $longitude, $latitude, $tilt'),
          child: Image.asset('assets/images/360_images/2.3.jpg'),
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
        break;
      case 10: // Image 2.4
        panorama = PanoramaViewer(
            onTap: (longitude, latitude, tilt) =>
                print('onTap: $longitude, $latitude, $tilt'),
            child: Image.asset('assets/images/360_images/2.4.jpg'),
            hotspots: [
              Hotspot(
                longitude: -5.4,
                latitude: -32.1,
                width: 50,
                height: 50,
                widget: hotspotButton(
                    icon: Icons.circle_outlined,
                    onPressed: () => setState(() => _panoId =9)), //Back to 2.3
              ),
              Hotspot(
                longitude: -5.6,
                latitude: -21.2,
                width: 48,
                height: 48,
                widget: hotspotButton(
                    icon: Icons.arrow_circle_up_outlined,
                    onPressed: () => setState(() => _panoId =4)), //Back to 2.1
              ),
              Hotspot(
                longitude: -102.0,
                latitude: -7.9,
                width: 80,
                height: 80,
                widget: hotspotButton(
                    icon: Icons.arrow_circle_up_outlined,
                    onPressed: () => setState(() => _panoId =7)), //to 3.3
              ),
            ]);

      default:
        panorama = PanoramaViewer(
          animSpeed: 1.0,
          sensorControl: SensorControl.orientation,
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
                  onPressed: () => setState(() => _panoId++)),
            ),
          ],
        );
    }
    return Scaffold(
      body: Stack(
        children: [
          panorama,
          Text(
              '${_lon.toStringAsFixed(panoImages.length.toInt())}, ${_lat.toStringAsFixed(panoImages.length.toInt())}, ${_tilt.toStringAsFixed(panoImages.length.toInt())}'),
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
