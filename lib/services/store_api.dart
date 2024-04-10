import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchStoreNames() async {
  final apiUrl = Uri.parse('https://mocki.io/v1/74e919d6-c518-46d2-a248-e6845cbd3837'); // Your API endpoint URL

  try {
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<String> names = List<String>.from(data['store_names']);
      return names;
    } else {
      throw Exception('Failed to load store names');
    }
  } catch (e) {
    throw Exception('Failed to load store names: $e');
  }
}
