import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/exhibition_photo.dart';
import 'package:Pharera/exhibition_video.dart';
// import 'package:Pharera/generated/l10n.dart';

class Tut extends StatefulWidget {
  const Tut({super.key});

  @override
  State<Tut> createState() => _TutState();
}

class _TutState extends State<Tut> with SingleTickerProviderStateMixin {
  late TabController ta;

  @override
  void initState() {
    super.initState();
    ta = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  const Color.fromARGB(255, 226, 226, 226),),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 410,
                child: TabBar(
                  // Remove the 'const' keyword here
                  controller: ta,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs:  [
                    Expanded(
                      child: Tab(
                        text: S.of(context).image,
                      ),
                    ),
                    Expanded(
                      child: Tab(
                        text: S.of(context).video,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: TabBarView(
                  controller: ta,
                  children:  [
                    TutPic(),
                    const TutVid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    ta.dispose();
    super.dispose();
  }
}
