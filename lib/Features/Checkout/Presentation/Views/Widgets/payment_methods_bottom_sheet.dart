import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/payment_details_view.dart';
import 'package:flutter/material.dart';

import 'payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const PaymentMethodsListView(),
          const SizedBox(height: 16),
          CustomButtom(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentDetailsView()));
            },
            text: 'Continue',
          )
        ],
      ),
    );
  }
}
