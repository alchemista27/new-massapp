import 'package:flutter/material.dart';
import 'package:massapp/models/material.dart';
import 'package:massapp/services/api_service.dart';

class MaterialsProvider with ChangeNotifier {
  List<Material> _materials = [];
  bool _isLoading = false;

  List<Material> get materials => _materials;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> loadMaterials() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _materials = await _apiService.getMaterials();
    } catch (e) {
      // Handle error
    }
    
    _isLoading = false;
    notifyListeners();
  }
}
