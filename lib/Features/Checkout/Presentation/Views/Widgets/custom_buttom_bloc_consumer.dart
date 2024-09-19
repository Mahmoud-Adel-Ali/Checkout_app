import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Core/utils/functions/show_snak_bar_message.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:checkout_app/Features/Checkout/Presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_input_model.dart';
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
          Navigator.of(context).pop();
          showSnakBarMessage(context, msg: state.errorMessage);
        } else if (state is PaymentSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ThankYouView()));
        }
      },
      builder: (context, state) {
        return CustomButtom(
          isLoading: state is PaymentLoading,
          onPressed: () {
            context.read<PaymentCubit>().makePayment(
                  paymentIntentInputModel: PaymentIntentInputModel(
                    amount: '100',
                    currency: 'USD',
                  ),
                );
          },
          text: 'Continue',
        );
      },
    );
  }
}
