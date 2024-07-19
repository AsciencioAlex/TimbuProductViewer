import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_api_app/models/cart_item.dart';
import 'package:timbu_api_app/models/product.dart';
import '../providers/product_provider.dart';
import 'product_detail_screen.dart';
import 'product_list_screen.dart';
import 'cart_screen.dart';
import 'order_history_screen.dart';
import 'profile_screen.dart';
import 'product_search_delegate.dart';
import 'wishlist_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'http://api.timbu.cloud/images/';
    return Scaffold(
      appBar: AppBar(
        title: Text('Timbu Mobile Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearchDelegate());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber,
                    child: Text(
                      'TMS',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good afternoon 👋', style: TextStyle(fontSize: 16)),
                      Text('Alex Ascencio',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return productProvider.products.isNotEmpty
                      ? Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '$imgUrl${productProvider.products[0].photos.isNotEmpty ? productProvider.products[0].photos[0] : 'placeholder.jpg'}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  productProvider.products[0].name,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '₦${productProvider.products[0].currentPrice}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .addProduct(
                                            productProvider.products[0]);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Added to cart')));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                  child: Text('Add to cart'),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(height: 20),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryIcon(title: 'Nike', icon: Icons.sports_basketball),
                    CategoryIcon(title: 'Gucci', icon: Icons.style),
                    CategoryIcon(
                        title: 'Jordan', icon: Icons.sports_basketball),
                    CategoryIcon(title: 'Balenciaga', icon: Icons.shopping_bag),
                    CategoryIcon(title: 'Adidas', icon: Icons.sports_soccer),
                    CategoryIcon(title: 'Reebok', icon: Icons.run_circle),
                    CategoryIcon(title: 'New Balance', icon: Icons.run_circle),
                    CategoryIcon(title: 'View all', icon: Icons.arrow_forward),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionHeader(title: 'Our Special Offers', onViewMore: () {}),
              SizedBox(height: 10),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  if (productProvider.products.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: productProvider.products.length,
                    itemBuilder: (context, index) {
                      final product = productProvider.products[index];
                      return ProductCard(product: product);
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              SectionHeader(
                  title: 'Featured Sneakers',
                  onViewMore: () {
                    Navigator.pushNamed(context, ProductListScreen.routeName);
                  }),
              SizedBox(height: 10),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  if (productProvider.products.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: productProvider.products.length,
                    itemBuilder: (context, index) {
                      final product = productProvider.products[index];
                      return ProductCard(product: product);
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProductListScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('View more'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Colors.black,
            ),
            label: 'All Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              color: Colors.black,
            ),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: 'Wishlist',
          ),
        ],
        selectedItemColor: Colors.blue,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, HomeScreen.routeName);
              break;
            case 1:
              Navigator.pushNamed(context, ProductListScreen.routeName);
              break;
            case 2:
              Navigator.pushNamed(context, CartScreen.routeName);
              break;
            case 3:
              Navigator.pushNamed(context, OrderHistoryScreen.routeName);
              break;
            case 4:
              Navigator.pushNamed(context, ProfileScreen.routeName);
              break;

            case 5:
              Navigator.pushNamed(context, WishlistScreen.routeName);
              break;
          }
        },
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryIcon({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewMore;

  const SectionHeader({Key? key, required this.title, required this.onViewMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: onViewMore, child: Text('View more')),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imgUrl = 'http://api.timbu.cloud/images/';
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.routeName,
            arguments: product);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(
                      '$imgUrl${product.photos.isNotEmpty ? product.photos[0] : 'placeholder.jpg'}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.brand,
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(product.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text('₦${product.currentPrice}',
                      style: TextStyle(fontSize: 14, color: Colors.blue)),
                  SizedBox(height: 5),
                  IconButton(
                    icon: Icon(
                      product.isWishlisted
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isWishlisted ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .toggleWishlistStatus(product.id);
                    },
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
