import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_generation_flutter/widgets/progress_indicator_with_percentage.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String? _imageUrl;
  const MyCachedNetworkImage({
    super.key,
    required String? imageUrl,
  }) : _imageUrl = imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _imageUrl!,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        var progress = downloadProgress.progress ?? 0;
        return ProgressIndicatorWithPercentage(progress: progress);
      },
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
      ),
    );
  }
}
