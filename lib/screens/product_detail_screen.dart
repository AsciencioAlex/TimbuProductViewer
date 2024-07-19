import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
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
        actions: [
          Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              return IconButton(
                icon: Icon(
                  product.isWishlisted ? Icons.favorite : Icons.favorite_border,
                  color: product.isWishlisted ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  productProvider.toggleWishlistStatus(product.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        product.isWishlisted
                            ? 'Removed from wishlist'
                            : 'Added to wishlist',
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product.photos.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      '$imgUrl${product.photos[0]}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 200);
                      },
                    ),
                  ),
                )
              else
                const Center(child: Icon(Icons.image_not_supported, size: 200)),
              SizedBox(height: 15),
              Text(
                'Iconic Casual Brands',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 5),
              Text(
                product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '₦${product.currentPrice.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '100 sold ',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Icon(Icons.star, color: Colors.orange, size: 14),
                  Text(
                    ' 4.5 (32 reviews)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                product.description.isEmpty
                    ? 'No description'
                    : product.description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 15),
              Text(
                'Size',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Wrap(
                spacing: 8.0,
                children: ['32', '35', '38', '39', '40', '42', '45']
                    .map((size) => ChoiceChip(
                          label: Text(size),
                          selected: product.size == size,
                          onSelected: (selected) {},
                        ))
                    .toList(),
              ),
              SizedBox(height: 15),
              Text(
                'Colours',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Wrap(
                spacing: 8.0,
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
              SizedBox(height: 15),
              Text(
                'Quantity',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                    child: Text('2'),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                'More from Ego',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₦${product.currentPrice.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.green, fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 15),
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
