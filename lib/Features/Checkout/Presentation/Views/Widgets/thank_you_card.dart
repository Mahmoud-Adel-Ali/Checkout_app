import 'package:checkout_app/Core/utils/styless.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/card_info_widget.dart';
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
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 66.0, left: 20, right: 20),
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
            const Spacer(),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.barcode, size: 64),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styless.style24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
                height:
                    ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29)
          ],
        ),
      ),
    );
  }
}
