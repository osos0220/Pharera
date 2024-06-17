

import 'package:Pharera/Local.dart';
import 'package:Pharera/cache_helper.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:Pharera/navigation_bar.dart';
import 'package:Pharera/welcome_page.dart';
import 'package:flutter/material.dart';
// import 'package:Pharera/welcome_page.dart';
// import 'package:Pharera/panorama.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FlutterDownloader.initialize(
    debug: true, // Optional: Set false to disable printing logs to console
  );

  // Load saved locale from SharedPreferences
  Locale savedLocale = await _getSavedLocale();

  runApp(MyApp(savedLocale));
}

Future<Locale> _getSavedLocale() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? languageCode = sharedPreferences.getString('languageCode');
  String? countryCode = sharedPreferences.getString('countryCode');

  if (languageCode != null && countryCode != null) {
    return Locale(languageCode, countryCode);
  } else {
    // Default to English if no saved locale is found
    return const Locale('en', 'US');
  }
}

class MyApp extends StatelessWidget {
  final Locale locale;
  
  const MyApp(this.locale, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Loacalstring(),
      locale: locale, // Use the saved locale
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
