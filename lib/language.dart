import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.language),
              label: Text(S.of(context).English),
              onPressed: () {
                var locale = const Locale('en', 'Us');
                Get.updateLocale(locale);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.language),
              label: Text(S.of(context).arabic),
              onPressed: () {
                var locale = const Locale('ar', 'arb');
                Get.updateLocale(locale);
              },
            ),
          ],
        ),
      ),
    );
  }
}