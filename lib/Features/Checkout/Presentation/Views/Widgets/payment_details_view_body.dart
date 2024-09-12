import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/custom_credit_card.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            PaymentMethodsListView(),
            CustomCreditCard(),
          ],
        ),
      ),
    );
  }
}
