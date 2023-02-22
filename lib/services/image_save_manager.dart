import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageSaveManager {
  static Future<void> saveImage(Uint8List imageData, String fileName) async {
    await ImageGallerySaver.saveImage(
      imageData,
      quality: 60,
      name: fileName,
    );
  }
}
