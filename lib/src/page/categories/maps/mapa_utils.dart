import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaUtils {
  static Future<BitmapDescriptor> getMarkerImageFromUrl2(
    File url,
    int targetWidth,
  ) async {
    
    final File markerImageFile =  url;
    if (targetWidth != null) {
      return convertImageFileToBitmapDescriptor(markerImageFile,
          size: targetWidth);
    } else {
      Uint8List markerImageBytes = await markerImageFile.readAsBytes();
      return BitmapDescriptor.fromBytes(markerImageBytes);
    }
  }

  
  static Future<BitmapDescriptor> convertImageFileToBitmapDescriptor(
      File imageFile,
      {int size = 100,
      bool addBorder = false,
      Color borderColor = Colors.white,
      double borderSize = 10,
      Color titleColor = Colors.transparent,
      Color titleBackgroundColor = Colors.transparent}) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
   

    //make canvas clip path to prevent image drawing over the circle
    final Path clipPath = Path();

    var rect = Rect.fromLTRB(
        size.toDouble() * 0.1, size.toDouble()*0.15, size.toDouble() * 0.8, size.toDouble()*0.85);
    
    clipPath.addOval(rect);
    /* clipPath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          0,
          0,
          size.toDouble()*1,
          size.toDouble()*1,
        ),
        
        Radius.circular(100),
      ),
    ); */
    /* clipPath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size / 2.toDouble(), size.toDouble() , 10, 10),
        Radius.circular(100),
      ),
    ); */
    canvas.clipPath(clipPath);

    //paintImage
    final Uint8List imageUint8List =  imageFile.readAsBytesSync();
    final ui.Codec codec = await ui.instantiateImageCodec(imageUint8List);
    final ui.FrameInfo imageFI = await codec.getNextFrame();
    paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(
          0,
          0,
          size.toDouble(),
          size.toDouble(),
        ),
        image: imageFI.image);

    //convert canvas as PNG bytes
    final _image = await pictureRecorder.endRecording().toImage(size, (size * 1.1).toInt());
    final data = await _image.toByteData(format: ui.ImageByteFormat.png);

    //convert PNG bytes as BitmapDescriptor
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  getTemporaryDirectory() {}
}
