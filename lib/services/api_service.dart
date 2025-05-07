import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://your-api-url.com/api';
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  // Login - keeps simple username/password structure
  static Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: _headers,
      body: json.encode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception(
        'Login failed (${response.statusCode}): ${response.body}',
      );
    }
  }

  // Registration - improved with type safety and error handling
  static Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
    required String education,
    required String jobDetails,
    required String skills,
    required String achievements,
    String? profilePictureUrl,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/users'),
        headers: _headers,
        body: json.encode({
          'user': {
            'username': username,
            'email': email,
            'password': password,
            'profile': {
              'education': education,
              'job_details': jobDetails,
              'skills': skills,
              'achievements': achievements,
              if (profilePictureUrl != null)
                'profile_picture': profilePictureUrl,
            },
          },
        }),
      );

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw _parseError(response);
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static dynamic _parseError(http.Response response) {
    try {
      final errorData = jsonDecode(response.body);
      return errorData['error'] ??
          'Registration failed (${response.statusCode})';
    } catch (_) {
      return 'Registration failed (${response.statusCode})';
    }
  }
}
