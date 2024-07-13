import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    const String imgUrl = 'http://api.timbu.cloud/images/';

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Adjusted padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.photos.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), // Adjusted border radius
                    child: Image.network(
                      '$imgUrl${product.photos[0]}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200, // Adjusted height
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported,
                            size: 200); // Adjusted icon size
                      },
                    ),
                  ),
                )
              else
                const Center(
                    child: Icon(Icons.image_not_supported,
                        size: 200)), // Adjusted icon size
              SizedBox(height: 15), // Adjusted spacing
              Text(
                'Iconic Casual Brands',
                style: TextStyle(
                    color: Colors.grey, fontSize: 12), // Adjusted font size
              ),
              SizedBox(height: 5),
              Text(
                product.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold), // Adjusted font size
              ),
              SizedBox(height: 10),
              Text(
                '₦${product.currentPrice.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.green, fontSize: 18), // Adjusted font size
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '100 sold ',
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey), // Adjusted font size
                  ),
                  Icon(Icons.star,
                      color: Colors.orange, size: 14), // Adjusted icon size
                  Text(
                    ' 4.5 (32 reviews)',
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey), // Adjusted font size
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold), // Adjusted font size
              ),
              SizedBox(height: 5),
              Text(
                product.description.isEmpty
                    ? 'No description'
                    : product.description,
                style: TextStyle(fontSize: 14), // Adjusted font size
              ),
              SizedBox(height: 15), // Adjusted spacing
              Text(
                'Size',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold), // Adjusted font size
              ),
              SizedBox(height: 5),
              Wrap(
                spacing: 8.0, // Adjusted spacing
                children: ['32', '35', '38', '39', '40', '42', '45']
                    .map((size) => ChoiceChip(
                          label: Text(size),
                          selected: product.size == size,
                          onSelected: (selected) {},
                        ))
                    .toList(),
              ),
              SizedBox(height: 15), // Adjusted spacing
              Text(
                'Colours',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold), // Adjusted font size
              ),
              SizedBox(height: 5),
              Wrap(
                spacing: 8.0, // Adjusted spacing
                children: [
                  Colors.orange,
                  Colors.purple,
                  Colors.green,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                  Colors.black,
                ]
                    .map((color) => ChoiceChip(
                          backgroundColor: color,
                          label: Text(''),
                          selected: product.color == color.toString(),
                          onSelected: (selected) {},
                        ))
                    .toList(),
              ),
              SizedBox(height: 15), // Adjusted spacing
              Text(
                'Quantity',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold), // Adjusted font size
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {},
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('2'), // Replace with dynamic quantity
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 15), // Adjusted spacing
              Text(
                'More from Ego',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold), // Adjusted font size
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 200, // Adjusted height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 120, // Adjusted width
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120, // Adjusted height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  10), // Adjusted border radius
                              image: DecorationImage(
                                image:
                                    NetworkImage('$imgUrl${product.photos[0]}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            product.name,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.bold), // Adjusted font size
                          ),
                          Text(
                            '₦${product.currentPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 12), // Adjusted font size
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 15), // Adjusted spacing
              ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addProduct(product);
                  Navigator.pushNamed(context, CartScreen.routeName);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Added to cart')));
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
