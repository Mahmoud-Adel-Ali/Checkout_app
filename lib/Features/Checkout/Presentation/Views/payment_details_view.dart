import 'package:checkout_app/Core/utils/functions/build_app_bar.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/payment_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: 'Payment Details',
          onTapOnLeading: () {
            Navigator.pop(context);
          }),
      body: const PaymentDetailsViewBody(),
    );
  }
}
