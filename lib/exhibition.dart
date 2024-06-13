import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/exhibition_photo.dart';
import 'package:Pharera/exhibition_video.dart';

class Tut extends StatefulWidget {
  const Tut({super.key});

  @override
  State<Tut> createState() => _TutState();
}

class _TutState extends State<Tut> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Use Colors class for better readability
      ),
      backgroundColor: Colors.grey[300], // Use Colors class for better readability
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
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: S.of(context).image,
                    ),
                    Tab(
                      text: S.of(context).video,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TutPic(),
                    TutVid(), // Remove const keyword as it's not necessary
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
    _tabController.dispose();
    super.dispose();
  }
}