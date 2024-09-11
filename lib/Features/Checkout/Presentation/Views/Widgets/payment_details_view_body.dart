import 'package:checkout_app/Core/utils/images.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/active_payment_item.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/in_active_payment_item.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActivePaymentItem(image: AppImages.imagesCard),
              InActivePaymentItem(image: AppImages.imagesPaypal),
              InActivePaymentItem(image: AppImages.imagesApplePay),
            ],
          ),
        ],
      ),
    );
  }
}
