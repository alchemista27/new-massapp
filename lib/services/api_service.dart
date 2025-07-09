import 'package:massapp/models/material.dart';
import 'package:massapp/models/user.dart';

class ApiService {
  Future<User> login(String email, String password) async {
    // Implementation
    return User(id: '1', fullName: 'Test User', nimNidn: '123', email: email, role: 'student');
  }

  Future<List<Material>> getMaterials() async {
    // Implementation
    return [];
  }
}
