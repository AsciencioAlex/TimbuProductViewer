import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderDetailScreen extends StatelessWidget {
  static const routeName = '/order-detail';

  @override
  Widget build(BuildContext context) {
    final Order order = ModalRoute.of(context)!.settings.arguments as Order;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.id}', style: TextStyle(fontSize: 18)),
            Text('Total Amount: ₦${order.amount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18)),
            Text('Date: ${order.dateTime}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Products:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...order.products.map((item) {
              return ListTile(
                title: Text(item.product.name),
                subtitle: Text(
                    '₦${item.product.currentPrice.toStringAsFixed(2)} x ${item.quantity}'),
                trailing: Text(
                    '₦${(item.product.currentPrice * item.quantity).toStringAsFixed(2)}'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
