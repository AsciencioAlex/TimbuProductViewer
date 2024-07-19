import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'product.dart';
import 'order.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount {
    return _items.fold(
        0.0, (sum, item) => sum + item.product.currentPrice * item.quantity);
  }

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

  void addOrder() {
    final total = totalAmount;
    final cartItems = [..._items];

    // Add the new order to a list of orders (to be implemented)
    // _orders.add(newOrder);

    clearCart();
    notifyListeners();
=======
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(child: Text('Your cart is empty.'));
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return ListTile(
                leading: Image.network(item.product.photos[0],
                    fit: BoxFit.cover, width: 50, height: 50),
                title: Text(item.product.name),
                subtitle: Text(
                    '\$${item.product.currentPrice.toStringAsFixed(2)} x ${item.quantity}'),
                trailing: Text(
                    '\$${(item.product.currentPrice * item.quantity).toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to checkout screen
              },
              child:
                  Text('Checkout (\$${cart.totalAmount.toStringAsFixed(2)})'),
            ),
          );
        },
      ),
    );
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
  }
}
