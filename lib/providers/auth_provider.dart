import 'package:flutter/material.dart';
import 'package:massapp/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  Map<String, dynamic>? _user;
  bool _isLoading = false;

  Map<String, dynamic>? get currentUser => _user;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
    return true;
      _user = await AuthService.login(email, password);
    } catch (e) {
    return false;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
