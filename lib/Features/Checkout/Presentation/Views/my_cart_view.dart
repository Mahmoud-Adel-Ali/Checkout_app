import 'package:checkout_app/Core/utils/images.dart';
import 'package:checkout_app/Core/utils/styless.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: Styless.style25),
        centerTitle: true,
        leading: Center(child: SvgPicture.asset(AppImages.imagesArrowBack)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.white),
        ),
      ),
      body: const MyCartViewBody(),
    );
  }
}
