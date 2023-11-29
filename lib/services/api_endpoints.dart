import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Map<String, dynamic>>> fetchNotifications(
      String apiUrl) async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Check if the response is a map (object)
        if (json.decode(response.body) is Map) {
          // Assuming your JSON structure is a map with a key 'data' containing a list
          var jsonData = json.decode(response.body)['data'];
          if (jsonData is List) {
            List<Map<String, dynamic>> data =
                List<Map<String, dynamic>>.from(jsonData);
            return data;
          }
        }
      }
      return [];
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
