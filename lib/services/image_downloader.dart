import 'package:flutter/material.dart';
import 'image_download_manager.dart';
import 'image_save_manager.dart';

class ImageDownloader {
  static Future<void> downloadAndSaveImage(
    String url,
    String fileName, {
    VoidCallback? onSuccess,
    VoidCallback? onFailure,
    void Function(int received, int total)? onProgress,
  }) async {
    try {
      final imageData =
          await ImageDownloadManager.downloadImage(url, onProgress: onProgress);
      await ImageSaveManager.saveImage(imageData, fileName);
      if (onSuccess != null) {
        onSuccess();
      }
    } catch (e) {
      if (onFailure != null) {
        onFailure();
      }
    }
  }
}
