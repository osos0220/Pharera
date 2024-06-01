import 'package:Pharera/panorama.dart';
import 'package:flutter/material.dart';
// import 'package:Pharera/welcome_page.dart';
// import 'package:Pharera/panorama.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBiaAhRyi3LRfsgq8t_-KxtLjJaolyt9K4",
        appId: "1:337345392254:android:c98882ec00fe4406c2722f",
        messagingSenderId: '...',
        projectId: "signup-login-93587",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await FlutterDownloader.initialize(
      debug: true // Optional: Set false to disable printing logs to console
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const VITPage(),
    );
  }
}
