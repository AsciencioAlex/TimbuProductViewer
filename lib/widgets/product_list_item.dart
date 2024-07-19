import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'http://api.timbu.cloud/images/';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: product.photos.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage('$imgUrl${product.photos[0]}'),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                          // Handle error
                        },
                      )
                    : null,
                color: product.photos.isEmpty ? Colors.grey[200] : null,
              ),
              child: product.photos.isEmpty
                  ? Icon(Icons.image_not_supported, size: 80)
                  : null,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
<<<<<<< HEAD
                          style: const TextStyle(
=======
                          style: TextStyle(
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
<<<<<<< HEAD
                        icon: const Icon(Icons.close),
=======
                        icon: Icon(Icons.close),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                        onPressed: () {
                          // Remove product from cart or list
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
<<<<<<< HEAD
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
=======
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: Text(
                          product.color,
<<<<<<< HEAD
                          style: const TextStyle(
=======
                          style: TextStyle(
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
<<<<<<< HEAD
                      const SizedBox(width: 10),
                      Text(
                        '| Size ${product.size}',
                        style: const TextStyle(
=======
                      SizedBox(width: 10),
                      Text(
                        '| Size ${product.size}',
                        style: TextStyle(
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
=======
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                        onPressed: () {
                          // Decrease product quantity
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('1'), // Replace with dynamic quantity
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Increase product quantity
                        },
                      ),
                      Spacer(),
                      Flexible(
                        child: Text(
                          '₦${product.currentPrice.toStringAsFixed(2)}',
<<<<<<< HEAD
                          style: const TextStyle(
=======
                          style: TextStyle(
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
