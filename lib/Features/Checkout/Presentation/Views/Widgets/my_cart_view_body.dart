import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Core/utils/images.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/order_info_item.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/total_price.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 25),
          Expanded(child: Image.asset(AppImages.imagesBasketImage)),
          const SizedBox(height: 25),
          const OrderInfoItem(
              orderName: 'Order Subtotal', orderprice: r'$42.97'),
          const SizedBox(height: 4),
          const OrderInfoItem(orderName: 'Discount', orderprice: r'$0'),
          const SizedBox(height: 4),
          const OrderInfoItem(orderName: 'Shipping', orderprice: r'$8'),
          const Divider(
            thickness: 3,
            color: Color(0xffC7C7C7),
            height: 34,
          ),
          const TotalPrice(totalPrice: r'$50.97'),
          const SizedBox(height: 16),
          CustomButtom(
            onPressed: () {
              showModalBottomSheet(
                context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
                builder: (context) => const PaymentMethodsBottomSheet(),
              );
            },
            text: 'Complete Payment',
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
