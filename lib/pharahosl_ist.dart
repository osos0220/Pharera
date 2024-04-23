class PharaohData {
  List<Map<String, String>> pharaoh = [
    {"image": "assets/images/akhnton.jpg", "name": "King Akhenaten"},
   {"image": "assets/images/hatshbsot.jpg", "name": "King Hatshbsot"},
   {"image": "assets/images/sonsrt1.jpg", "name": "King Sonsrt1"},
   {"image": "assets/images/sonsrt3.jpg", "name": "King Sonsrt3"},
   {"image": "assets/images/to7tmos.jpg", "name": "King Tahtmos"},
  ];

  String getImage(int index) {
    return pharaoh[index]['image']!;
  }

  String getName(int index) {
    return pharaoh[index]['name']!;
  }
}