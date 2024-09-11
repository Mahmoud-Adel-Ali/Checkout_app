import 'package:checkout_app/Core/utils/images.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child:
              PaymentItem(image: items[index], isActive: true),
        ),
      ),
    );
  }
}

final List<String> items = [
    AppImages.imagesCard,
    AppImages.imagesPaypal,
    AppImages.imagesApplePay,
  ];
  int currenIndex = 0;