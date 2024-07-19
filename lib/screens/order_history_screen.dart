import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/order.dart';
import 'order_detail_screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  static const routeName = '/order-history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final orders = cartProvider.orders;
          if (orders.isEmpty) {
            return Center(child: Text('No orders found.'));
          }
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text('Order ${order.id}'),
                  subtitle: Text('Amount: ₦${order.amount.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          OrderDetailScreen.routeName,
                          arguments: order);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
