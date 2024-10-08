import 'package:checkout_app/Core/utils/functions/build_app_bar.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const MyCartViewBody(),
    );
  }
}
