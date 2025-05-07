import 'package:ui/services/api_service.dart';

class AuthRepository {
  // Login method using ApiService
  Future<String> login(String username, String password) async {
    try {
      final token = await ApiService.login(username, password);
      return token;
    } catch (e) {
      rethrow; // Forward the error to be handled in the provider or UI
    }
  }

  // Register method using ApiService
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
    try {
      final response = await ApiService.registerUser(
        username: username,
        email: email,
        password: password,
        education: education,
        jobDetails: jobDetails,
        skills: skills,
        achievements: achievements,
        profilePictureUrl: profilePictureUrl,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
