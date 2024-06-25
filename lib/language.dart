// language_selection_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                // Update the app's locale to English
                var locale = const Locale('en', 'US');
                Get.updateLocale(locale);
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 174, 158, 130),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.language),
                    Text('english'.tr, style: const TextStyle(fontSize: 25)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                // Update the app's locale to Arabic
                var locale = const Locale('ar', 'AR');
                Get.updateLocale(locale);
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 174, 158, 130),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.language),
                    Text('arabic'.tr, style: const TextStyle(fontSize: 25)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                // Update the app's locale to French
                var locale = const Locale('fr', 'FR');
                Get.updateLocale(locale);
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 174, 158, 130),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.language),
                    Text('french'.tr, style: const TextStyle(fontSize: 25)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                // Update the app's locale to German
                var locale = const Locale('de', 'DE');
                Get.updateLocale(locale);
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 174, 158, 130),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.language),
                    Text('german'.tr, style: const TextStyle(fontSize: 25)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
