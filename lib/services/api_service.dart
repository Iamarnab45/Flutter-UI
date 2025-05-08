import '../repository/auth_repository.dart';

class ApiService {
  final AuthRepository _authRepository;

  ApiService({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository();

  Future<String> login(String username, String password) async {
    try {
      return await _authRepository.login(username, password);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
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
    try {
      return await _authRepository.registerUser(
        username: username,
        email: email,
        password: password,
        education: education,
        jobDetails: jobDetails,
        skills: skills,
        achievements: achievements,
        profilePictureUrl: profilePictureUrl,
      );
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }
}
