import 'dart:convert';
import 'package:http/http.dart' as http;



Future<void> sendOpenAIRequest() async {
  const String openaiApiKey = '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'; // OpenAI API anahtarınızı buraya ekleyin

  const String apiUrl = 'https://api.openai.com/v1/chat/completions';
  final Map<String, dynamic> requestData = {
    "model": "gpt-3.5-turbo",
    "messages": [
      {"role": "user", "content": "Say this is a test!"}
    ],
    "temperature": 0.7
  };

  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $openaiApiKey",
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final String completionText = responseData['choices'][0]['message']['content'];
    print('Cevap: $completionText');
  } else {
    print('HTTP Hatası: ${response.statusCode}');
    print('Hata Mesajı: ${response.body}');
  }
}
