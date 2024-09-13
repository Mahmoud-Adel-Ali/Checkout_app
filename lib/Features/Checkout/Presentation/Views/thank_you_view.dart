import 'package:checkout_app/Core/utils/functions/build_app_bar.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTapOnLeading: (){
        Navigator.pop(context);
      }),
      body:  Transform.translate(
        offset: const Offset(0, -18),
        child: const ThankYouViewBody()),
    );
  }
}
