import 'package:flutter/material.dart';
import 'package:ui/repository/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  String? _token;
  bool _isLoading = false;
  String? _error;

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
    String? profilePictureUrl,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authRepository.registerUser(
        username: username,
        email: email,
        password: password,
        education: education,
        jobDetails: jobDetails,
        skills: skills,
        achievements: achievements,
        profilePictureUrl: profilePictureUrl,
      );
      print("Registration Success: $result");
    } catch (e) {
      _error = e.toString();
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
