import 'package:flutter/material.dart';
import 'package:massapp/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userRole;

  String? get token => _token;
  String? get userRole => _userRole;

  Future<bool> login(String email, String password) async {
    try {
      _token = await AuthService.login(email, password);
      _userRole = await AuthService.getUserRole();
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String fullName, String id, String email, String password, String role) async {
    try {
      await AuthService.register(fullName, id, email, password, role);
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _token = null;
    _userRole = null;
    notifyListeners();
  }
}
