import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Core/utils/styless.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/payment_details_view.dart';
import 'package:checkout_app/Features/Checkout/Presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage,style: Styless.style18)),
          );
        } else if (state is PaymentSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const PaymentDetailsView()));
        }
      },
      builder: (context, state) {
        return CustomButtom(
          isLoading: state is PaymentLoading,
          onPressed: () {},
          text: 'Continue',
        );
      },
    );
  }
}
