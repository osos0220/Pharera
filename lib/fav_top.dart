// import 'package:flutter/material.dart';
// import 'favorites_provider.dart';
// import 'video_item.dart'; // Separate file for VideoItem widget
//
// class TopFavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final favoritesProvider = FavoritesProvider();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Top Favorites'),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: favoritesProvider.fetchTopFavorites(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return const Center(child: Text('Error loading favorites.'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No favorite videos or images found.'));
//           } else {
//             final favorites = snapshot.data!;
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//               ),
//               itemCount: favorites.length,
//               itemBuilder: (context, index) {
//                 final favorite = favorites[index];
//                 final isVideo = favorite['type'] == 'video';
//                 final path = favorite['path'];
//
//                 return Container(
//                   margin: const EdgeInsets.all(10.0),
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey, width: 2),
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                       ),
//                     ],
//                   ),
//                   child: isVideo
//                       ? VideoItem(videoAssetPath: path)
//                       : Image.network(
//                     path,
//                     fit: BoxFit.cover,
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'fav_prov_temp.dart';
import 'video_item.dart'; // Separate file for VideoItem widget

class TopFavoritesPage extends StatelessWidget {
  const TopFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = FavoritesProvider();

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: favoritesProvider.fetchTopFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return  Center(child: Text(S.of(context).ErroR));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return  Center(child: Text(S.of(context).NoFAV));
          } else {
            final favorites = snapshot.data!;
            final images = favorites.where((element) => element['type'] == 'image').toList();
            final videos = favorites.where((element) => element['type'] == 'video').toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: images.length + videos.length,
              itemBuilder: (context, index) {
                if (index < images.length) {
                  final imagePath = images[index]['path'];
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  final videoPath = videos[index - images.length]['path'];
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: VideoItem(videoAssetPath: videoPath),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
