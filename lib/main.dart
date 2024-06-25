import 'package:Pharera/Local.dart';
import 'package:Pharera/cache_helper.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:Pharera/welcome_page.dart';
import 'package:Pharera/splash_screen.dart'; // Import the splash screen
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterDownloader.initialize(
      debug: false // Optional: Set false to disable printing logs to console
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Locale? locale;
  const MyApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    var deviceLocale = locale ?? Get.deviceLocale;
    var fallbackLocale = const Locale('en', 'US');

    return GetMaterialApp(
      translations: Loacalstring(),
      locale: deviceLocale,
      fallbackLocale: fallbackLocale,
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
      home: SplashScreen(), // Set SplashScreen as the initial screen
    );
  }
}
