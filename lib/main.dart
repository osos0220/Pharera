

import 'package:Pharera/Local.dart';
import 'package:Pharera/cache_helper.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:Pharera/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyBiaAhRyi3LRfsgq8t_-KxtLjJaolyt9K4",
  //       appId: "1:337345392254:android:c98882ec00fe4406c2722f",
  //       messagingSenderId: '...',
  //       projectId: "signup-login-93587",
  //       // Your web Firebase config options
  //     ),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }
  await FlutterDownloader.initialize(
      debug: false // Optional: Set false to disable printing logs to console
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Loacalstring(),
      locale: const Locale("en"),
      localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}
