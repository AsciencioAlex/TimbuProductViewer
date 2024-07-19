import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/order.dart';
import '../models/cart_item.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  final List<Order> _orders = [];

  List<CartItem> get items => _items;

  double get totalAmount {
    return _items.fold(
        0.0, (sum, item) => sum + item.product.currentPrice * item.quantity);
  }

  List<Order> get orders => _orders;

  void addProduct(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0 && _items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void addOrder(List<CartItem> cartItems, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        amount: total,
        products: cartItems,
        dateTime: DateTime.now(),
      ),
    );
    _items.clear(); // Clear the cart after adding the order
    notifyListeners();
  }
}
