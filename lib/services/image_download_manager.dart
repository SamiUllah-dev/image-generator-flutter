import 'dart:typed_data';
import 'package:dio/dio.dart';

class ImageDownloadManager {
  static Future<Uint8List> downloadImage(String url,
      {void Function(int received, int total)? onProgress}) async {
    var response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
      onReceiveProgress: onProgress,
    );
    return Uint8List.fromList(response.data);
  }
}
