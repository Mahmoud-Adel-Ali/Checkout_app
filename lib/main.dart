import 'package:checkout_app/Features/Checkout/Presentation/Views/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:checkout_app/Core/utils/api_keys.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
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

//// payment steps(stripe)
// => https://docs.page/flutter-stripe/flutter_stripe/sheet
// paymentIntentObject ===> 1. create payment intent ( required ( amount , currency) , not required (.....))
// 2. Integrate the payment sheet(paymentIntentClientSecret)              [Client Side]
// 3. present the payment sheet await Stripe.instance.presentPaymentSheet();
