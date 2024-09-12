import 'package:checkout_app/Core/utils/functions/build_app_bar.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: '',
          onTapOnLeading: () {
            Navigator.pop(context);
          }),
    );
  }
}