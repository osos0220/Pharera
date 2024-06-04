import 'package:Pharera/Check.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/pharaoh_show.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final PharaohData pharaohData = PharaohData();
  
  List<Map<String, String>> displayedPharaohs = [];
  TextEditingController searchController = TextEditingController();
  late FocusNode searchFocusNode;
  bool isSearchFocused = false;
  


  @override
  void initState() {
    super.initState();
    displayedPharaohs = [...IsArab() ?  pharaohData.pharaooh :  pharaohData.pharaoh]; // Use only English list initially
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
    List<Map<String, String>> allPharaohs = [];
    allPharaohs.addAll(IsArab() ?  pharaohData.pharaooh :  pharaohData.pharaoh);

    if (query.isNotEmpty) {
      final filteredPharaohs = allPharaohs.where((pharaoh ,) {
        final nameLowerEn = pharaoh['name']!.toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLowerEn.contains(searchLower);
      }).toList();
      setState(() {
        displayedPharaohs = filteredPharaohs;
      });
    } else {
      setState(() {
        displayedPharaohs = allPharaohs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            pharaohData: pharaohData,
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          IsArab() ?  pharaohData.pharaooh[index]['image']! :  pharaohData.pharaoh[index]['image']!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      title: Text(
                        IsArab() ?  pharaohData.pharaooh[index]['name']! :  pharaohData.pharaoh[index]['name']!,
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
