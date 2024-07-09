import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.photos.isNotEmpty)
              Image.network(
                product.photos.first,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Text('Image not available');
                },
              ),
            SizedBox(height: 10),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Price: \$${product.currentPrice.toStringAsFixed(2)}'),
            Text('Available Quantity: ${product.availableQuantity}'),
            Text('Status: ${product.status}'),
            SizedBox(height: 10),
            if (product.description.isNotEmpty)
              Text(
                product.description,
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
