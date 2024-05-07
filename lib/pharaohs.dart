import 'package:flutter/material.dart';
import 'package:flutter_application_09/main_up.dart';
import 'package:flutter_application_09/navigation_bar.dart';
import 'package:flutter_application_09/notifacation.dart';
import 'package:flutter_application_09/pharahosl_ist.dart';
import 'package:flutter_application_09/pharaoh_show.dart';

class Groub extends StatefulWidget {
  const Groub({Key? key}) : super(key: key);

  @override
  _GroubState createState() => _GroubState();
}

class _GroubState extends State<Groub> {
  final PharaohData pharaohData = PharaohData();
  String _selectedPhoto = "";
  String _selectedName = "";

  @override
  void initState() {
    super.initState();
    // Select the first photo automatically when the page is entered
    _selectedPhoto = pharaohData.pharaoh.first['name']!;
    _selectedName = pharaohData.pharaoh.first['name']!;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Not()),
                );
              },
              child: const Icon(Icons.circle_notifications_outlined, size: 40),
            ),
          )
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.14,
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
            SizedBox(height: screenHeight * 0.02),
            _selectedPhoto.isNotEmpty
                ? Container(
              width: screenWidth * 0.8,
              alignment: AlignmentDirectional.bottomCenter,
              height: screenHeight * 0.7,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    pharaohData.pharaoh.firstWhere((e) => e['name'] == _selectedPhoto)['image'] ?? "",
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _selectedName,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding:  EdgeInsets.only(bottom: screenHeight*0.009),
                    child: SizedBox(
                      width: screenWidth * 0.33,
                      height: screenHeight * 0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PharaohDetailPage(
                                pharaohData: pharaohData,
                                index: pharaohData.pharaoh.indexWhere((e) => e['name'] == _selectedPhoto),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "EXPLORE",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
                : Container(
              width: screenWidth * 0.7,
              height: screenHeight * 0.69,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    pharaohData.pharaoh.firstWhere((e) => e['name'] == "King Akhenaten")['image'] ?? "",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWidget(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPhoto = pharaohData.pharaoh[index]['name']!;
          _selectedName = pharaohData.pharaoh[index]['name']!;
        });
      },
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.15,
            height: screenHeight * 0.09,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.transparent,
              ),
              image: DecorationImage(
                image: AssetImage(pharaohData.pharaoh[index]['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
           SizedBox(height: screenHeight*0.005), // Adjust spacing as needed
          Container(
            width: screenWidth * 0.03, // Adjust width as needed
            height: screenHeight * 0.01, // Adjust height as needed
            decoration: BoxDecoration(
              color: _selectedPhoto == pharaohData.pharaoh[index]['name'] ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}
