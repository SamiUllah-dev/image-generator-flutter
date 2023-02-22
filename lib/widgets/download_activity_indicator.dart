import 'package:flutter/material.dart';

class DownloadActivityIndicator extends StatelessWidget {
  final double _progress;
  const DownloadActivityIndicator({
    super.key,
    required double progress,
  }) : _progress = progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: _progress,
          color: Colors.white,
        ),
        const Icon(
          Icons.download,
          size: 18,
        ),
      ],
    );
  }
}
