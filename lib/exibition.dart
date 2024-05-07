import 'package:flutter/material.dart';
import 'package:pharera/exipition_photo.dart';

class Tut extends StatefulWidget {
  const Tut({Key? key}) : super(key: key);

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
                
                child: Expanded(
                  child: TabBar(
                    controller: ta,
                    
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Expanded(
                        child: Tab(
                          text: "Images",
                        ),
                      ),
                      Expanded(
                        child: Tab(
                          text: "Videos",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: TabBarView(
                  controller: ta,
                  children: const [
                    TutPic(),
                    Center(
                      child: Text('Content for Tab 8'),
                    ),
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
