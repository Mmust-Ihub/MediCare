import 'dart:convert';

import 'package:http/http.dart' as http;


class GeminiService {
  static const String baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

  final String _apiKey;

  GeminiService({required String apiKey}) : _apiKey = apiKey;

  Future<String> getResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl?key=$_apiKey"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "role": "user",
              "parts": [
                {
                  "text": "You are a helpful medical practitioner.Your name is Dr.Kingsly. You are supposed to give advice on medical related fields, recommend the user what to do and maybe medications to take"
                      "Answer questions mainly in medical related fields"
                }
              ]
            },
            {
              "role": "user",
              "parts": [
                {"text": userMessage}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["candidates"]?[0]["content"]?["parts"]?[0]["text"] ??
            "No response from AI.";
      } else {
        return "Error: ${response.reasonPhrase} - ${response.body}";
      }
    } catch (e) {
      return "Failed to connect to AI: $e";
    }
  }
}
