import 'package:flutter/material.dart';
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
  }
}
