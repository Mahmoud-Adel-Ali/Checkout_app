import 'package:checkout_app/Core/utils/styless.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem(
      {super.key, required this.orderName, required this.orderprice});
  final String orderName;
  final String orderprice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(orderName, style: Styless.style18),
        Text(orderprice, style: Styless.style18),
      ],
    );
  }
}
