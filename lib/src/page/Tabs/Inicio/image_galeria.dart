import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marca_loreto/src/utils/constants.dart';
import 'package:photo_view/photo_view.dart';

class ImageGaleria extends StatelessWidget {
  const ImageGaleria({Key? key, required this.imageGalery}) : super(key: key);
  final String imageGalery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: PageView(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (algo) {
              if (algo.primaryDelta! > 7) {
                Navigator.pop(context);
              }
            },
            child: Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: PhotoView(
                      imageProvider: CachedNetworkImageProvider(
                        '$apiBaseURL/$imageGalery',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
