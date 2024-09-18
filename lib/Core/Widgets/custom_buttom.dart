import 'package:checkout_app/Core/utils/styless.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.isLoading = false,
  });
  final Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading ? () {} : onPressed,
      color: color ?? const Color(0xff34A853),
      textColor: textColor ?? Colors.black,
      minWidth: MediaQuery.sizeOf(context).width,
      height: 73,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(text, style: Styless.style22),
    );
  }
}
