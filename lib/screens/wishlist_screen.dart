import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';
import 'product_detail_screen.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'http://api.timbu.cloud/images/';

    return Scaffold(
      appBar: AppBar(
        title: Text('My Wishlist', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          final wishlistItems = productProvider.wishlistedProducts;
          if (wishlistItems.isEmpty) {
            return Center(child: Text('Your wishlist is empty.'));
          }

          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: wishlistItems.length,
            itemBuilder: (context, index) {
              final product = wishlistItems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProductDetailScreen.routeName,
                    arguments: product,
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              '$imgUrl${product.photos.isNotEmpty ? product.photos[0] : 'placeholder.jpg'}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.brand,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '₦${product.currentPrice}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
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
