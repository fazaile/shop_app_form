import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopp_app/providers/cart.dart';
import 'package:shopp_app/providers/orders.dart';
import 'package:shopp_app/screens/cart_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(), //refer kat item.dart
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(), //refer kat item.dart
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ], //tempat register
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) =>
                CartScreen(), // tengok product overview
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductScreen.routeName: (context) => UserProductScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          }),
    );
  }
}
