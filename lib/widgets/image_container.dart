import 'package:flutter/material.dart';
import 'package:image_generation_flutter/widgets/cached_network_image.dart';

class ImageContainer extends StatefulWidget {
  final bool _isGenerating;
  final String? _imageUrl;
  final String _displayMessage;
  const ImageContainer({
    super.key,
    required bool isGenerating,
    required String? imageUrl,
    required String displayMessage,
  })  : _isGenerating = isGenerating,
        _imageUrl = imageUrl,
        _displayMessage = displayMessage;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          color: Colors.grey,
          blurRadius: 4,
        ),
      ], color: Colors.white),
      height: MediaQuery.of(context).size.width,
      width: double.infinity,
      child: widget._isGenerating
          ? const Center(
              child: Text(
                'Image is being generated...',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          : widget._imageUrl == null
              ? Center(
                  child: Text(
                    widget._displayMessage,
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              : MyCachedNetworkImage(imageUrl: widget._imageUrl),
    );
  }
}
