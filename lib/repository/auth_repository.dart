import 'dart:convert';
import 'api_client.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  Future<String> login(String username, String password) async {
    final response = await _apiClient.post(
      'login',
      body: {'username': username, 'password': password},
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = _apiClient.parseResponse(response);
      return data['token'];
    } else {
      throw Exception(_apiClient.parseError(response));
    }
  }

  Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
    required String education,
    required String jobDetails,
    required String skills,
    required String achievements,
    String? profilePictureUrl,
  }) async {
    final response = await _apiClient.post(
      'users',
      body: {
        'user': {
          'username': username,
          'email': email,
          'password': password,
          'profile': {
            'education': education,
            'job_details': jobDetails,
            'skills': skills,
            'achievements': achievements,
            if (profilePictureUrl != null) 'profile_picture': profilePictureUrl,
          },
        },
      },
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return _apiClient.parseResponse(response);
    } else {
      throw Exception(_apiClient.parseError(response));
    }
  }
}
