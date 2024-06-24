import 'dart:convert';
import 'package:http/http.dart' as http;

class WebServices {
  String baseUrl;

  WebServices(this.baseUrl);

  Future<dynamic> getRequest(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(
      url,
      headers: _createHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: _createHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<Map<String, dynamic>> putRequest(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.put(
      url,
      headers: _createHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<void> deleteRequest(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.delete(
      url,
      headers: _createHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete data');
    }
  }

  Future<bool> testConnection() async {
    try {
      final url = Uri.parse('$baseUrl/startup');
      final response = await http.get(
        url,
        headers: _createHeaders(),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error testing connection: $e');
      return false;
    }
  }

  Map<String, String> _createHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }
}
