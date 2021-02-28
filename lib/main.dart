import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:my_shop/providers/order_provider.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:my_shop/screens/order_screen.dart';
import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:my_shop/screens/products_overview_screen.dart';
import 'package:my_shop/screens/shopping_cart_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => ProductsProvider()),
        ChangeNotifierProvider(create: (c) => CartProvider()),
        ChangeNotifierProvider(create: (c) => OrderProvider())
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          ShoppingCartScreen.routeName: (ctx) => ShoppingCartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen()
        },
      ),
    );
  }
}