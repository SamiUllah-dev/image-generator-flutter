import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_generation_flutter/widgets/download_activity_indicator.dart';

import '../services/image_downloader.dart';

class ImageDownloadButton extends StatefulWidget {
  final String? _imageUrl;
  final bool _isGenerating;

  const ImageDownloadButton({
    super.key,
    required String? imageUrl,
    required bool isGenerating,
  })  : _imageUrl = imageUrl,
        _isGenerating = isGenerating;

  @override
  State<ImageDownloadButton> createState() => _ImageDownloadButtonState();
}

class _ImageDownloadButtonState extends State<ImageDownloadButton> {
  bool _isDownloading = false;
  double _progress = 0;
  @override
  Widget build(BuildContext context) {
    return _isDownloading
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: DownloadActivityIndicator(
              progress: _progress,
            ),
          )
        : IconButton(
            iconSize: 35,
            splashRadius: 25,
            onPressed: widget._imageUrl == null || widget._isGenerating
                ? null
                : _downloadAndSaveImage,
            icon: const Icon(
              Icons.download,
            ),
          );
  }

  _downloadAndSaveImage() async {
    setState(
      () => _isDownloading = true,
    );
    await ImageDownloader.downloadAndSaveImage(
      widget._imageUrl!,
      DateTime.now().toString(),
      onSuccess: () => Fluttertoast.showToast(
        msg: 'Image downloaded successfully',
        toastLength: Toast.LENGTH_LONG,
      ),
      onFailure: () => Fluttertoast.showToast(
        msg: 'Failed to download image',
        toastLength: Toast.LENGTH_LONG,
      ),
      onProgress: (received, total) {
        double progress = received / total;
        setState(() => _progress = progress);
      },
    );
    _progress = 0;
    setState(
      () => _isDownloading = false,
    );
  }
}
