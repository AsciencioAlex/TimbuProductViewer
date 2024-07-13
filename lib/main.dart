import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';
import 'screens/cart_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/PaymentSelectionScreen.dart';
import 'screens/PaymentSuccessScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(
            create: (context) => ProductProvider()..fetchProducts()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          CheckoutScreen.routeName: (context) => CheckoutScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          ProductListScreen.routeName: (context) => ProductListScreen(),
          PaymentSelectionScreen.routeName: (context) =>
              PaymentSelectionScreen(),
          PaymentSuccessScreen.routeName: (context) => PaymentSuccessScreen(),
        },
      ),
    );
  }
}
