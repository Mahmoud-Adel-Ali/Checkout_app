import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivePaymentItem extends StatelessWidget {
  const ActivePaymentItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
              width: 1.5,
              color: Colors.green ),
        ),
        shadows: const[
          BoxShadow(
            color:  Colors.green ,
            blurRadius: 4,
            offset: Offset(0, 0),
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
