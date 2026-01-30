import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:corporate_ai_assistant/config/env.dart';

class AIService {
  final String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  /// Sends the user query along with retrieved context (RAG) to the LLM.
  Future<String> generateResponse(String userQuery, String context) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Env.openAIApiKey}',
        },
        body: jsonEncode({
          'model': 'gpt-4-turbo',
          'messages': [
            {
              'role': 'system',
              'content': 'You are a helpful corporate assistant. Use the following context to answer the user query: $context'
            },
            {'role': 'user', 'content': userQuery},
          ],
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception('Failed to load AI response: ${response.statusCode}');
      }
    } catch (e) {
      // TODO: Implement better error logging
      print('AI Service Error: $e');
      return 'Sorry, I encountered an error processing your request.';
    }
  }
}
