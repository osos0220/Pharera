import 'package:flutter/material.dart';
import 'package:flutter_application_09/pharahosl_ist.dart';
import 'package:flutter_application_09/pharadetails.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Row(
            children: [
              Icon(Icons.notification_add),
              SizedBox(width: 20),
            ],
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    width: 328,
                    alignment: AlignmentDirectional.bottomCenter,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          pharaohData.pharaoh.firstWhere((e) =>
                                  e['name'] == _selectedPhoto)['image'] ??
                              "",
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _selectedName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 110,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PharaohDetailPage(
                                        pharaohData: pharaohData, index: 0)),
                              );
                            },
                            child: const Text(
                              "EXPLORE",
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    width: 328,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          pharaohData.pharaoh.firstWhere((e) =>
                                  e['name'] == "King Akhenaten")['image'] ??
                              "",
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
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPhoto = pharaohData.pharaoh[index]['name']!;
          _selectedName = pharaohData.pharaoh[index]['name']!;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedPhoto == pharaohData.pharaoh[index]['name']
                ? Colors.blue
                : Colors.transparent,
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
