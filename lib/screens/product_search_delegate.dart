import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'product_detail_screen.dart';

class ProductSearchDelegate extends SearchDelegate<Product?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        final results = productProvider.products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final product = results[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('₦${product.currentPrice.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductDetailScreen.routeName,
                  arguments: product,
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
