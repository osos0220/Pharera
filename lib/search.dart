import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Pharera/pharahos_list.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  final PharaohData pharaohData = PharaohData();
  List<Map<String, String>> displayedPharaohs = [];
  List<Map<String, String>> displayedPharaoohs = [];

  TextEditingController searchController = TextEditingController();
  late FocusNode searchFocusNode;
  bool isSearchFocused = false;
  String? lastSearchQuery;
  final Duration _debounceDuration = const Duration(milliseconds: 300);
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    displayedPharaohs = _getAllPharaohs();
    displayedPharaoohs = _getAllPharaoohs();
    searchFocusNode = FocusNode();
    searchFocusNode.addListener(() {
      setState(() {
        isSearchFocused = searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    searchFocusNode.dispose();
    super.dispose();
  }

  List<Map<String, String>> _getAllPharaohs() {
    return [...pharaohData.pharaoh,];
  }
  List<Map<String, String>> _getAllPharaoohs() {
    return [...pharaohData.pharaooh,];
  }

  void _filterPharaohs(String query) {
    if (query == lastSearchQuery) return; // Avoid redundant filtering

    lastSearchQuery = query;

    if (_debounceTimer != null) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(_debounceDuration, () {
      final allPharaohs = _getAllPharaohs();
      if (query.isNotEmpty) {
        final filteredPharaohs = allPharaohs.where((pharaoh) {
          final nameLower = pharaoh['name']?.toLowerCase() ?? '';
          final nameEnLower = pharaoh['namee']?.toLowerCase() ?? '';
          final searchLower = query.toLowerCase();
          return nameLower.contains(searchLower) ||
              nameEnLower.contains(searchLower);
        }).toList();
        setState(() {
          displayedPharaohs = filteredPharaohs;
        });
      } else {
        setState(() {
          displayedPharaohs = allPharaohs;
        });
      }
    });
  }
  void _filterPharaoohs(String query) {
    if (query == lastSearchQuery) return; // Avoid redundant filtering

    lastSearchQuery = query;

    if (_debounceTimer != null) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(_debounceDuration, () {
      final allPharaoohs = _getAllPharaoohs();
      if (query.isNotEmpty) {
        final filteredPharaoohs = allPharaoohs.where((pharaooh) {
          final nameLower = pharaooh['name']?.toLowerCase() ?? '';
          final nameEnLower = pharaooh['namee']?.toLowerCase() ?? '';
          final searchLower = query.toLowerCase();
          return nameLower.contains(searchLower) ||
              nameEnLower.contains(searchLower);
        }).toList();
        setState(() {
          displayedPharaoohs = filteredPharaoohs;
        });
      } else {
        setState(() {
          displayedPharaoohs = allPharaoohs;
        });
      }
    });
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
        title: Text(
          isArabic ? "بحث الفراعنة" : "Search Pharaohs",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
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
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenWidth * 0.03,
                ),
              ),
            ),
          ),
          if (isSearchFocused) ...[
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: ListView.builder(
                itemCount:isArabic ? displayedPharaohs.length:displayedPharaoohs.length,
                itemBuilder: (context, index) {
                  final pharaoh = displayedPharaohs[index];
                  final paharooh= displayedPharaoohs[index];
                  return GestureDetector(
                    onTap: () {
                      final name = pharaoh['name'];
                      final namee = pharaoh['namee'];
                      final details =pharaoh['details'];
                      final detailss =paharooh['detailss'];
                      final image = pharaoh['image'];

                      if (name != null &&
                          namee != null &&
                          details != null &&
                          detailss != null &&
                          image != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PharaohDetailPage(
                              name: name,
                              nameEn: namee,
                              details: details,
                              image: image, detailss: detailss,
                            ),
                          ),
                        );
                      }
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
                        isArabic ? pharaoh['namee']! : pharaoh['name']!,
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

class PharaohDetailPage extends StatelessWidget {
  final String name;
  final String nameEn;
  final String details;
  final String detailss;
  final String image;

  const PharaohDetailPage({
    required this.name,
    required this.nameEn,
    required this.details,
    required this.detailss,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(
        title: Text(isArabic ? nameEn : name),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image),
              const SizedBox(height: 16.0),
              Text(
                isArabic ? nameEn : name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(isArabic?detailss:details),
            ],
          ),
        ),
      ),
    );
  }
}
