import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vox_pad/logic/services/TokenService.dart';

class WebServices {
  final String baseUrl;
  String token;

  WebServices(this.baseUrl, this.token);

  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final url = Uri.https(baseUrl, endpoint);
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
    final url = Uri.https(baseUrl, endpoint);
    final response = await http.post(
      url,
      headers: _createHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<Map<String, dynamic>> putRequest(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, endpoint);
    final response = await http.put(
      url,
      headers: _createHeaders(),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<void> deleteRequest(String endpoint) async {
    final url = Uri.https(baseUrl, endpoint);
    final response = await http.delete(
      url,
      headers: _createHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete data');
    }
  }

  Map<String, String> _createHeaders() {
    String token = TokenManager.getToken() as String;
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
