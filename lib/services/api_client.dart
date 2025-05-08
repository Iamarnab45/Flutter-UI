import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String _baseUrl = 'https://your-api-url.com/api';
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    try {
      return await http.post(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: _headers,
        body: json.encode(body),
      );
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  dynamic parseResponse(http.Response response) {
    try {
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception('Failed to parse response: $e');
    }
  }

  String parseError(http.Response response) {
    try {
      final errorData = jsonDecode(response.body);
      return errorData['error'] ?? 'Request failed (${response.statusCode})';
    } catch (_) {
      return 'Request failed (${response.statusCode})';
    }
  }
} 