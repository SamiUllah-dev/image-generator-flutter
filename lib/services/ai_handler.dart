import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final openAI = OpenAI.instance.build(
    token: '<your API key here>',
    baseOption: HttpSetup(receiveTimeout: 20000),
    isLogger: true,
  );

  Future<ImageUrl?> generateImage(String prompt) async {
    try {
      final request = GenerateImage(
        prompt,
        1,
        size: '1024x1024',
      );
      final response = await openAI.generateImage(request);
      final imageDataList = response?.data;
      final imageData = imageDataList?.last;
      return imageData?.url;
    } catch (e) {
      print(e);
    }
    return null;
  }

  void dispose() {
    openAI.close();
  }
}

typedef ImageUrl = String;
