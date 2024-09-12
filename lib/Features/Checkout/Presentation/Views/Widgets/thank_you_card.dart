import 'package:checkout_app/Core/utils/styless.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/order_info_item.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 66.0),
      child: Column(
        children: [
          const Text('Thank you!', style: Styless.style25),
          Text('Your transaction was successful', style: Styless.style20),
          const SizedBox(height: 42),
          const OrderInfoItem(orderName: 'Date', orderprice: '01/24/2023'),
          const SizedBox(height: 20),
          const OrderInfoItem(orderName: 'Time', orderprice: '10:15 AM'),
          const SizedBox(height: 20),
          const OrderInfoItem(orderName: 'To', orderprice: 'Sam Louis'),
          const Divider(height: 60, thickness: 2),
          const TotalPrice(totalPrice: r'$50.97'),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
