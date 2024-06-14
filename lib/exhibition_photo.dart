import 'package:flutter/material.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/pharaoh_show.dart';
import 'package:Pharera/Check.dart';
import 'favorites_provider.dart'; // Import your favorites provider

class TutPic extends StatefulWidget {
  TutPic({super.key});

  @override
  _TutPicState createState() => _TutPicState();
}

class _TutPicState extends State<TutPic> {
  final PharaohData pharaohData = PharaohData();
  late FavoritesProvider favoritesProvider; // Declare your favorites provider

  @override
  void initState() {
    super.initState();
    favoritesProvider = FavoritesProvider();
    favoritesProvider.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int startIndex = 8;
    int itemCount = IsArab()
        ? pharaohData.pharaooh.length - startIndex
        : pharaohData.pharaoh.length - startIndex;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: screenHeight * 0.03),
                scrollDirection: Axis.vertical,
                itemCount: itemCount,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: screenHeight * 0.03);
                },
                itemBuilder: (_, index) {
                  int actualIndex = index + startIndex;
                  final ex = IsArab()
                      ? pharaohData.pharaooh[actualIndex]
                      : pharaohData.pharaoh[actualIndex];
                  final isFavorite = favoritesProvider.favoriteIndexes.contains(actualIndex);
                  return Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.04, right: screenWidth * 0.04),
                    child: Stack(
                      children: [
                        Container(
                          width: screenWidth * 0.95,
                          height: screenHeight * 0.37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PharaohDetailPage(
                                    pharaohData: pharaohData,
                                    index: actualIndex,
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                ex['image'] ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              favoritesProvider.toggleFavorite(actualIndex);
                              setState(() {}); // Force rebuild to update favorite status
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}