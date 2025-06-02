import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String? _errorMessage;
  String? _currentUser;

  // Getters
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String? get errorMessage => _errorMessage;
  String? get currentUser => _currentUser;

  // Test credentials
  static const String _testUsername = "admin";
  static const String _testPassword = "12345678";

  // Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Login method
  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 2));

      // Check credentials
      if (username.trim() == _testUsername && password == _testPassword) {
        _isAuthenticated = true;
        _currentUser = username;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = "Invalid username or password";
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = "Login failed. Please try again.";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Quick login method (for test account)
  Future<bool> quickLogin() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call delay
      await Future.delayed(Duration(seconds: 1));

      _isAuthenticated = true;
      _currentUser = _testUsername;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = "Quick login failed. Please try again.";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Skip login method
  Future<bool> skipLogin() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 500));

    _isAuthenticated = true;
    _currentUser = "Guest";
    _isLoading = false;
    notifyListeners();
    return true;
  }

  // Logout method
  void logout() {
    _isAuthenticated = false;
    _currentUser = null;
    _errorMessage = null;
    notifyListeners();
  }

  // Reset password method (placeholder)
  Future<bool> resetPassword(String username) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 1));
      // Simulate password reset
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = "Password reset failed. Please try again.";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}