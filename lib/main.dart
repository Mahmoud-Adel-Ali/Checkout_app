import 'package:checkout_app/Features/Checkout/Presentation/Views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyCartView(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
