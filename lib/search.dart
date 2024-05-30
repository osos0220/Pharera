import 'package:flutter/material.dart';
import 'package:flutter_application_09/pharahos_list.dart';
import 'package:flutter_application_09/pharaoh_show.dart';
import 'package:flutter_application_09/pharaohs_list_ar.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final PharaohData pharaohData = PharaohData();
  final PharaohDataAr pharaohDataAr = PharaohDataAr();
  List<Map<String, String>> displayedPharaohs = [];
  TextEditingController searchController = TextEditingController();
  late FocusNode searchFocusNode;
  bool isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    displayedPharaohs = pharaohData.pharaoh;
    searchFocusNode = FocusNode();
    searchFocusNode.addListener(() {
      setState(() {
        isSearchFocused = searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  void _filterPharaohs(String query) {
    final pharaohs = pharaohData.pharaoh;
    if (query.isNotEmpty) {
      final filteredPharaohs = pharaohs.where((pharaoh) {
        final nameLower = pharaoh['name']!.toLowerCase();
        final nameeLower = pharaoh['namee']!.toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower) || nameeLower.contains(searchLower);
      }).toList();
      setState(() {
        displayedPharaohs = filteredPharaohs;
      });
    } else {
      setState(() {
        displayedPharaohs = pharaohs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.06),
            child: TextField(
              controller: searchController,
              focusNode: searchFocusNode,
              onChanged: (value) {
                _filterPharaohs(value);
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.03),
              ),
            ),
          ),
          if (isSearchFocused) ...[
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount: displayedPharaohs.length,
                itemBuilder: (context, index) {
                  final pharaoh = displayedPharaohs[index];
                  return GestureDetector(
                    onTap: () {
                     Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PharaohDetailPage(
      pharaohDataAr: pharaohDataAr,
      pharaohData: pharaohData,
      index: index,
      // Provide an instance of ExData if needed
    ),
  ),
);

                    },
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          pharaoh['image']!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                       isArabic ? pharaohDataAr.getName(index) : pharaohData.getName(index),
                      ),
                      subtitle: Text(
                       isArabic ? pharaohDataAr.getNamee(index) : pharaohData.getNamee(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
