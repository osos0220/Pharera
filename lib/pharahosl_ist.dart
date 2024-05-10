class PharaohData {
  List<Map<String, String>> pharaoh = [
    {"image": "assets/images/قناع-الملك-توت-عنخ-آمون.jpg", "name": "King Tutankhamun"},
    {"image": "assets/images/amnthotb el talt (1).jpg", "name": "King Amnthotb III"},
    {"image": "assets/images/hatshbsot.jpg", "name": "King Hatshbsot"},
    {"image": "assets/images/akhnton.jpg", "name": "King Akhenaten"},
   {"image": "assets/images/sonsrt3.jpg", "name": "King Sonsrt III"},
    {"image": "assets/images/sonsrt1.jpg", "name": "King Sonsrt I"},
    {"image": "assets/images/to7tmos.jpg", "name": "King Tahtmos III"},


  ];

  String getImage(int index) {
    return pharaoh[index]['image']!;
  }

  String getName(int index) {
    return pharaoh[index]['name']!;
  }
}