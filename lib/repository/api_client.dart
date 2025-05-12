import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String _baseUrl = 'https://your-api-url.com/api';
  static const Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
  };

  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/$endpoint').replace(
        queryParameters: queryParams,
      );
      return await _client.get(
        uri,
        headers: {..._defaultHeaders, ...?headers},
      );
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<http.Response> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      return await _client.post(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: {..._defaultHeaders, ...?headers},
        body: json.encode(body),
      );
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<http.Response> put(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      return await _client.put(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: {..._defaultHeaders, ...?headers},
        body: json.encode(body),
      );
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      return await _client.delete(
        Uri.parse('$_baseUrl/$endpoint'),
        headers: {..._defaultHeaders, ...?headers},
      );
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  dynamic parseResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        throw Exception('Failed to parse response: $e');
      }
    } else {
      throw Exception(parseError(response));
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

  void dispose() {
    _client.close();
  }
} 