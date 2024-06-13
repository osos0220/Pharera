import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/models/image_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavsUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static List<String> favoriteImageIds = [];
  static late SharedPreferences prefs;
  static List<ImageModel> favImages = [];

  static Future getFavsFromFirestore() async {
    for (String id in favoriteImageIds) {
      var res = await firestore.collection('images').doc(id).get();
      favImages.add(ImageModel.fromJson(res.data() ?? {}));
    }
  }

  static Future postImageToFIrestore(ImageModel image) async {
    String docId = firestore.collection('images').doc().id;
    image.id = docId;
    // ImageModel imageInstance = ImageModel(
    //   description: "sasasa",
    //   id: docId,
    //   image: "htttp://sad.com",
    // );
    await firestore.collection('images').doc(docId).set(image.toJson());
  }

  static Future addToFavorite(String userId, String imageId) async {
    favoriteImageIds.add(imageId);
    prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setStringList(userId, favoriteImageIds);

    if (kDebugMode) {
      if (!res) {
        throw Exception("Not added!!");
      }
    }
    return res ? "Added Successfully" : "Not added!!";
  }

  static Future initializeFavorites(String userId) async {
    favoriteImageIds.clear();
    prefs = await SharedPreferences.getInstance();
    favoriteImageIds = prefs.getStringList(userId) ?? [];
  }

  static Future removeFromFavorites(String userId, String imageId) async {
    favoriteImageIds.removeWhere((element) => element == imageId);
    prefs = await SharedPreferences.getInstance();
    bool res = await prefs.setStringList(userId, favoriteImageIds);
    if (kDebugMode) {
      if (!res) {
        throw Exception("Not removed!!");
      }
    }
    return res ? "Removed Successfully" : "Not removed!!";
  }

  //checks whether the image is in fav or not // determine whether you add to favs or remove from favs
  static bool isInFavs(String imageId) {
    var res = favoriteImageIds.any((element) => element == imageId);
    return res;
  }
}
