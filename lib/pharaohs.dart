import 'package:flutter/material.dart';
import 'package:flutter_application_09/Check.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/fav_but.dart';
import 'package:flutter_application_09/generated/l10n.dart';
import 'package:flutter_application_09/navigation_bar.dart';
import 'package:flutter_application_09/notifacation.dart';
import 'package:flutter_application_09/pharahos_list.dart';
import 'package:flutter_application_09/pharaoh_show.dart';
import 'package:flutter_application_09/pharaohs_list_ar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';



class Groub extends StatefulWidget {
  const Groub({Key? key}) : super(key: key);

  @override
  _GroubState createState() => _GroubState();
}

class _GroubState extends State<Groub> {
  final PharaohData pharaohData = PharaohData();
  final PharaohDataAr pharaohDataAr = PharaohDataAr();
  String _selectedPhoto = "";
  String _selectedName = "";
  String _selectedDetails = "";
  int _selectedIndex = 0;
  final SheetController _sheetController = SheetController();

  @override
  void initState() {
    super.initState();
    // Set the initial selected index to 0
    _selectedPhoto = IsArab() ? pharaohDataAr.pharaooh[0]['name']! : pharaohData.pharaoh[0]['name']!;
    _selectedName = IsArab() ? pharaohDataAr.pharaooh[0]['name']! : pharaohData.pharaoh[0]['name']!;
    _selectedDetails = IsArab() ? pharaohDataAr.pharaooh[0]['details']! : pharaohData.pharaoh[0]['details']!;
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
          
          Column(
            children: [
              SizedBox(
                height: 56,
                child: Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) => _buildPhotoWidget(i),
                    separatorBuilder: (ctx, i) => const SizedBox(width: 8),
                    itemCount: IsArab() ? pharaohDataAr.pharaooh.length : pharaohData.pharaoh.length,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              _selectedPhoto.isNotEmpty
                  ? Stack(
                    children:[       
                      Container(
                                    width: 340,
                                    alignment: AlignmentDirectional.bottomCenter,
                                    height: 400,
                                    decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        IsArab() ? pharaohDataAr.pharaooh[_selectedIndex]['image'] ?? "" : pharaohData.pharaoh[_selectedIndex]['image'] ?? "",
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
                                  pharaohDataAr: pharaohDataAr,
                                  pharaohData: pharaohData,
                                  index: _selectedIndex,
                                ),
                              ),
                            );
                          },
                          child: TextW(text: S.of(context).Explore,)
                        ),
                      )
                    ],
                                    ),
                                    
                                  ),
                                  const Positioned(
                              right: 285,
                              top: 5,
                              child: HeartIconButton(),
                            ),
                                  
                                  ]
                  )
                  : Container(
                width: 340,
                height: 540,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(IsArab() ? pharaohDataAr.pharaooh.firstWhere((e) => e['name'] == "King Akhenaten")['image'] ?? "" : pharaohData.pharaoh.firstWhere((e) => e['name'] == "King Akhenaten")['image'] ?? ""),
                  ),
                ),
              ),
            ],
          ),
          SlidingSheet(
            controller: _sheetController,
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.3, 0.6, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedName,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _selectedDetails,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
             _selectedPhoto = IsArab() ? pharaohDataAr.pharaooh[index]['name']! : pharaohData.pharaoh[index]['name']!;
    _selectedName = IsArab() ? pharaohDataAr.pharaooh[index]['name']! : pharaohData.pharaoh[index]['name']!;
    _selectedDetails = IsArab() ? pharaohDataAr.pharaooh[index]['details']! : pharaohData.pharaoh[index]['details']!;
    _selectedIndex = index;
  });
  _sheetController.snapToExtent(0.7);
},
child: Container(
  width: 50,
  height: 50,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: _selectedPhoto == (IsArab() ? pharaohDataAr.pharaooh[index]['name'] : pharaohData.pharaoh[index]['name']) ? Colors.yellow : Colors.transparent,
      width: 2,
    ),
    image: DecorationImage(
      image: AssetImage(IsArab() ? pharaohDataAr.pharaooh[index]['image']! : pharaohData.pharaoh[index]['image']!),
      fit: BoxFit.cover,
    ),
  ),
),
);
}
}

