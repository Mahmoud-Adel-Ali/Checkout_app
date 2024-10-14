import 'package:checkout_app/Core/enums/payment_type.dart';
import 'package:checkout_app/Core/utils/images.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/custom_buttom_bloc_consumer.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  final List<String> items = [
    AppImages.imagesCard,
    AppImages.imagesPaypal,
    AppImages.imagesPaymob,
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          SizedBox(
            height: 62,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                    onTap: () {
                      activeIndex = index;
                      setState(() {});
                    },
                    child: PaymentItem(
                        image: items[index], isActive: index == activeIndex)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButtomBlocConsumer(
            paymentType: activeIndex == 0
                ? PaymentType.creditCard
                : activeIndex == 1
                    ? PaymentType.paypal
                    : PaymentType.paymob,
          )
        ],
      ),
    );
  }
}
