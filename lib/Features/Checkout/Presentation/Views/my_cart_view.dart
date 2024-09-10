import 'package:checkout_app/Core/utils/styless.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart',style:  Styless.style25),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
      ),
    );
  }
}