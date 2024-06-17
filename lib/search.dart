import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Pharera/pharahos_list.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

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
                _filterPharaoohs(value);
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
  itemCount: isArabic ? displayedPharaohs.length : displayedPharaoohs.length,
  itemBuilder: (context, index) {
    if ((isArabic && index >= displayedPharaohs.length) || 
        (!isArabic && index >= displayedPharaoohs.length)) {
      return Container(); // إرجاع عنصر فارغ إذا كان الفهرس خارج النطاق
    }

    final pharaoh =  displayedPharaohs[index];
    final paharooh = displayedPharaoohs[index];
    return GestureDetector(
      onTap: () {
        final name = pharaoh['name'];
        final namee = pharaoh['namee'];
        final details = pharaoh['details'];
        final detailss = paharooh['detailss'];
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
                image: image,
                detailss: detailss,
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width:500,
          height: 100,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  pharaoh['image']!,
                  fit: BoxFit.fill,
                  width: 500,
                ),
              ),
              Container(
                width: 500,
               decoration: BoxDecoration( color: Colors.black.withOpacity(0.1) , borderRadius: BorderRadius.circular(30)),
              ),
              Center(
                child: Text(
                  isArabic ? pharaoh['namee']! : pharaoh['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
        ],
      ),
    );
  }
}
 /*ListTile(
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
                    ),*/

class PharaohDetailPage extends StatelessWidget {
  final String name;
  final String nameEn;
  final String details;
  final String detailss;
  final String image;

  const PharaohDetailPage({super.key, 
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
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          image,
                          width: 300, // تحديد عرض الصورة
                          height: 430, // تحديد ارتفاع الصورة
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: 400,
                height: 430,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                             isArabic ? nameEn : name,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 20),
                          Text(
                           isArabic?detailss:details,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
/* Scaffold(
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
    );*/