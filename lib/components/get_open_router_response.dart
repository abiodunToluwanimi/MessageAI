import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:second_draft/api/api_key.dart';

Future<String> getOpenRouterResponse(String userInput) async {
  const endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  final headers = {
    
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'model': 'meta-llama/llama-3-8b-instruct',
    'messages': [
      {'role': 'user', 'content': userInput}
    ],
    'max_tokens': 150,
    'temperature': 0.7,
  });

  try {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data['choices'][0]['message']['content'];
    } else {
      
      return 'API Error: ${response.statusCode}\n${response.body}';
    }
  } catch (e) {
    return 'Connection Error: Check your internet or API url.';
  }
}