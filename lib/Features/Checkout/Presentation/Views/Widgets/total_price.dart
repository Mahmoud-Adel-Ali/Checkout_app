import 'package:checkout_app/Core/utils/styless.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.totalPrice});
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total', style: Styless.style24),
        Text(totalPrice, style: Styless.style24),
      ],
    );
  }
}
