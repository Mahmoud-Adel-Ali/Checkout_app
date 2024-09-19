import 'package:checkout_app/Core/utils/styless.dart';
import 'package:flutter/material.dart';

showSnakBarMessage(BuildContext context, {required String msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg,style: Styless.style18),
      backgroundColor: Colors.red.shade200,
      duration: const Duration(seconds: 5),
    ),
  );
}