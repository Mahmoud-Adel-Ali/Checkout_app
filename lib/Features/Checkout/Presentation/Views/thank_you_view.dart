import 'package:checkout_app/Core/utils/functions/build_app_bar.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/thank_you_view_body.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/my_cart_view.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatefulWidget {
  const ThankYouView({super.key});

  @override
  State<ThankYouView> createState() => _ThankYouViewState();
}

class _ThankYouViewState extends State<ThankYouView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const MyCartView()),
          (route) {
            return false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTapOnLeading: () {
        Navigator.pop(context);
      }),
      body: Transform.translate(
          offset: const Offset(0, -18), child: const ThankYouViewBody()),
    );
  }
}
