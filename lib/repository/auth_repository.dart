import '../services/api_client.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<String> login(String username, String password) async {
    final response = await _apiClient.post('login', {
      'username': username,
      'password': password,
    });

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
    final response = await _apiClient.post('users', {
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
    });

    if (response.statusCode == 201) {
      return _apiClient.parseResponse(response);
    } else {
      throw Exception(_apiClient.parseError(response));
    }
  }
}
