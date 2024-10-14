import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.image, required this.isActive});
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              width: 1.5, color: isActive ? Colors.green : Colors.grey),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? Colors.green : Colors.white,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: SvgPicture.asset(image)),
      ),
    );
  }
}
