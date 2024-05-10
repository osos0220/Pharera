import 'package:flutter/material.dart';
import 'package:flutter_application_09/notifacation.dart';
import 'package:flutter_application_09/pharahosl_ist.dart';
import 'package:flutter_application_09/pharadetails.dart';
import 'package:flutter_application_09/test.dart';

class Groub extends StatefulWidget {
  const Groub({Key? key}) : super(key: key);

  @override
  _GroubState createState() => _GroubState();
}

class _GroubState extends State<Groub> {
  final PharaohData pharaohData = PharaohData();
  String _selectedPhoto = "";
  String _selectedName = "";
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set the initial selected index to 0
    _selectedPhoto = pharaohData.pharaoh[0]['name']!;
    _selectedName = pharaohData.pharaoh[0]['name']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Not()),
              );
            },
            child: Container(
              width: 40, // Adjust the width to make it smaller
              height: 40, // Adjust the height to make it smaller
              child: Image.asset('assets/images/notification.jpg'), // Replace with image widget
            ),
          ),
          const SizedBox(width: 10),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align items at the top
          children: [
            SizedBox(
              height: 56,
              child: Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) => _buildPhotoWidget(i),
                  separatorBuilder: (ctx, i) => const SizedBox(width: 8),
                  itemCount: pharaohData.pharaoh.length,
                ),
              ),
            ),
            const SizedBox(height: 64),
            _selectedPhoto.isNotEmpty
                ? Container(
              width: 340,
              alignment: AlignmentDirectional.bottomCenter,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    pharaohData.pharaoh[_selectedIndex]['image'] ?? "",
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _selectedName,
                    style: const TextStyle(color: Colors.transparent, fontSize: 24),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 110,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PharaohDetailPage(
                              pharaohData: pharaohData,
                              index: _selectedIndex,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "EXPLORE",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            )
                : Container(
              width: 340,
              height: 540,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(pharaohData.pharaoh.firstWhere((e) => e['name'] == "King Akhenaten")['image'] ?? ""),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPhoto = pharaohData.pharaoh[index]['name']!;
          _selectedName = pharaohData.pharaoh[index]['name']!;
          _selectedIndex = index; // Set the selected index
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedPhoto == pharaohData.pharaoh[index]['name'] ? Colors.yellow : Colors.transparent,
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage(pharaohData.pharaoh[index]['image']!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
