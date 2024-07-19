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

  List<Product> get wishlistedProducts {
    return _products.where((product) => product.isWishlisted).toList();
  }

  void toggleWishlistStatus(String productId) {
    final index = _products.indexWhere((product) => product.id == productId);
    if (index >= 0) {
      _products[index].isWishlisted = !_products[index].isWishlisted;
      notifyListeners();
    }
  }
}
