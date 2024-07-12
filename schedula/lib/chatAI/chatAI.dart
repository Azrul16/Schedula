import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatAI extends StatefulWidget {
  const ChatAI({super.key});

  @override
  State<ChatAI> createState() => _ChatAIState();
}

class _ChatAIState extends State<ChatAI> {
  String? responseText;
  TextEditingController controller = TextEditingController();

  void contoPrint() {
    print('Ok till here');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (responseText != null) Text(responseText!),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: contoPrint,
                    child: const Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initiateGemini() async {
    final apiKey = dotenv.env['geminiAPI'];
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      return;
    }

    // The Gemini 1.5 models are versatile and work with most use cases
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final content = [Content.text(controller.text)];
    final response = await model.generateContent(content);

    responseText = response.text;

    setState(() {});
  }
}
