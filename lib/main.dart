import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';
import 'package:exer_6_state_management_rmcaoile/screen/MyCatalog.dart';
import 'package:exer_6_state_management_rmcaoile/screen/MyCart.dart';
import 'package:exer_6_state_management_rmcaoile/screen/Checkout.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ShoppingCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/products": (context) => const MyCatalog(),
        "/cart": (context) => const MyCart(),
        // Checkout route
        "/checkout": (context) => const Checkout(),
      },
      home: const MyCatalog(),
    );
  }
}
