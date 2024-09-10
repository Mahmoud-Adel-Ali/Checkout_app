import 'package:checkout_app/Core/utils/images.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 25),
        Image.asset(AppImages.imagesBasketImage),
      ],
    );
  }
}