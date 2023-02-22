import 'package:flutter/material.dart';
import 'package:image_generation_flutter/services/ai_handler.dart';
import 'package:image_generation_flutter/widgets/description_field.dart';
import 'package:image_generation_flutter/widgets/image_download_button.dart';
import 'package:image_generation_flutter/widgets/image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final aiHandler = AIHandler();
  String? _imageUrl;
  bool _isGenerating = false;
  String _displayMessage = 'Input a description to generate an image';

  @override
  void dispose() {
    aiHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
        actions: [
          ImageDownloadButton(
            imageUrl: _imageUrl,
            isGenerating: _isGenerating,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageContainer(
                isGenerating: _isGenerating,
                imageUrl: _imageUrl,
                displayMessage: _displayMessage,
              ),
              const SizedBox(height: 14),
              DescriptionField(
                isGenerating: _isGenerating,
                onSubmitted: generateImage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generateImage(String prompt) async {
    setState(() => _isGenerating = true);
    final result = await aiHandler.generateImage(prompt);
    setState(() {
      _isGenerating = false;
      _imageUrl = result ?? _imageUrl;
      _displayMessage = result == null
          ? 'An error occurred. Please try again.'
          : _displayMessage;
    });
  }
}
