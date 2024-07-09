import 'package:flutter/material.dart';
import '../services/timbu_api_service.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _loading = false;
  String? _error;

  List<Product> get products => _products;
  bool get loading => _loading;
  String? get error => _error;

  void fetchProducts() async {
    _loading = true;
    notifyListeners();

    try {
      _products = await TimbuApiService().fetchProducts();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
