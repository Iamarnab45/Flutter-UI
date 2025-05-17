import 'package:flutter/material.dart';
import '../repository/auth_repository.dart';
import '../repository/api_client.dart';

class AuthProvider with ChangeNotifier {
  late final AuthRepository _authRepository;
  String? _token;
  bool _isLoading = false;
  String? _error;

  AuthProvider({required ApiClient apiClient}) {
    _authRepository = AuthRepository(apiClient: apiClient);
  }

  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Login
  Future<void> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _token = await _authRepository.login(username, password);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Register
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String education,
    required String jobDetails,
    required String skills,
    required String achievements,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _authRepository.registerUser(
        username: username,
        email: email,
        password: password,
        education: education,
        jobDetails: jobDetails,
        skills: skills,
        achievements: achievements,
      );
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
