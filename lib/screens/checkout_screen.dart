import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'PaymentSelectionScreen.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'http://api.timbu.cloud/images/';

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Consumer<CartProvider>(
              builder: (context, cart, child) {
                return Column(
                  children: cart.items.map((item) {
                    return ListTile(
                      leading: item.product.photos.isNotEmpty
                          ? Image.network(
                              '$imgUrl${item.product.photos[0]}',
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image_not_supported,
                                    size: 50);
                              },
                            )
                          : const Icon(Icons.image_not_supported, size: 50),
                      title: Text(item.product.name),
                      subtitle: Text(
                          '₦${item.product.currentPrice.toStringAsFixed(2)} x ${item.quantity}'),
                      trailing: Text(
                          '₦${(item.product.currentPrice * item.quantity).toStringAsFixed(2)}'),
                    );
                  }).toList(),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
                'Total: ₦${Provider.of<CartProvider>(context).totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PaymentSelectionScreen.routeName);
              },
              child: Text('Proceed to Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50), // Adjust button size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
