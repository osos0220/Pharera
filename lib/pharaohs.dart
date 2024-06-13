import 'package:Pharera/Check.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/notifacation.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/pharaoh_show.dart';
import 'package:Pharera/navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class Groub extends StatefulWidget {
  const Groub({super.key});

  @override
  _GroubState createState() => _GroubState();
}

class _GroubState extends State<Groub> {
  late PharaohData _pharaohData;

  String _selectedPhoto = "";
  String _selectedName = "";
  String _selectedDetails = "";
  int _selectedIndex = 0;
  final SheetController _sheetController = SheetController();
  bool _isSheetAttached = false;

  @override
  void initState() {
    super.initState();
    _pharaohData = PharaohData();

    // Set the initial selected index to 0
    _selectedPhoto = IsArab()
        ? _pharaohData.pharaooh[0]['image']!
        : _pharaohData.pharaoh[0]['image']!;
    _selectedName = IsArab()
        ? _pharaohData.pharaooh[0]['name']!
        : _pharaohData.pharaoh[0]['name']!;
    _selectedDetails = IsArab()
        ? _pharaohData.pharaooh[0]['explore']!
        : _pharaohData.pharaoh[0]['explore']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Not()),
              );
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: Image.asset('assets/images/notification.jpg'),
            ),
          ),
          const SizedBox(width: 10),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: const MyHomePage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 56,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) => _buildPhotoWidget(i),
                    separatorBuilder: (ctx, i) => const SizedBox(width: 8),
                    itemCount: _pharaohData.pharaoh.take(7).length,
                  ),
                ),
                const SizedBox(height: 10),
                _selectedPhoto.isNotEmpty
                    ? Container(
                        width: 340,
                        alignment: AlignmentDirectional.bottomCenter,
                        height: 410,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              IsArab()
                                  ? _pharaohData.pharaooh[_selectedIndex]
                                      ['image']!
                                  : _pharaohData.pharaoh[_selectedIndex]
                                      ['image']!,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _selectedName,
                              style: const TextStyle(
                                  color: Colors.transparent, fontSize: 24),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PharaohDetailPage(
                                      pharaohData: _pharaohData,
                                      index: _selectedIndex,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 90,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    S.of(context).Explore,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 340,
                        height: 460,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(_pharaohData.pharaoh.firstWhere(
                                        (e) => e['name'] == "King Akhenaten")[
                                    'image'] ??
                                ""),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!_isSheetAttached) {
                _sheetController.snapToExtent(0.7);
                _isSheetAttached = true;
              }
            },
            child: SlidingSheet(
              controller: _sheetController,
              elevation: 8,
              cornerRadius: 16,
              snapSpec: const SnapSpec(
                snap: true,
                snappings: [0.25, 0.6, 1.0],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedName,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _selectedDetails,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPhoto = IsArab()
              ? _pharaohData.pharaooh[index]['image']!
              : _pharaohData.pharaoh[index]['image']!;
          _selectedName = IsArab()
              ? _pharaohData.pharaooh[index]['name']!
              : _pharaohData.pharaoh[index]['name']!;
          _selectedDetails = IsArab()
              ? _pharaohData.pharaooh[index]['explore']!
              : _pharaohData.pharaoh[index]['explore']!;
          _selectedIndex = index;
        });
        _isSheetAttached = false; // Reset the attachment flag
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: _selectedPhoto == _pharaohData.pharaoh[index]['name']
                ? Colors.yellow
                : Colors.transparent,
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage(IsArab()
                ? _pharaohData.pharaooh[index]['image']!
                : _pharaohData.pharaoh[index]['image']!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
