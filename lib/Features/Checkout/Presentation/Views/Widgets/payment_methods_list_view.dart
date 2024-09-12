import 'package:checkout_app/Core/utils/images.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> items = [
    AppImages.imagesCard,
    AppImages.imagesPaypal,
    AppImages.imagesApplePay,
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
