import 'dart:developer';

import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Core/utils/functions/show_snak_bar_message.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:checkout_app/Features/Checkout/Presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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
          log(state.errorMessage);
        } else if (state is PaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        }
      },
      builder: (context, state) {
        return CustomButtom(
          isLoading: state is PaymentLoading,
          onPressed: () {
            // context.read<PaymentCubit>().makePayment(
            //       paymentIntentInputModel: PaymentIntentInputModel(
            //         amount: '100',
            //         currency: 'USD',
            //         customerId: 'cus_QsXJYf3W0UeU4U',
            //       ),
            //     );

            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId: "YOUR CLIENT ID",
                secretKey: "YOUR SECRET KEY",
                transactions: const [
                  {
                    "amount": {
                      "total": '100',
                      "currency": "USD",
                      "details": {
                        "subtotal": '100',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '10',
                          "currency": "USD"
                        },
                        {
                          "name": "Pineapple",
                          "quantity": 5,
                          "price": '12',
                          "currency": "USD"
                        }
                      ],

                      // Optional
                      //   "shipping_address": {
                      //     "recipient_name": "Tharwat samy",
                      //     "line1": "tharwat",
                      //     "line2": "",
                      //     "city": "tharwat",
                      //     "country_code": "EG",
                      //     "postal_code": "25025",
                      //     "phone": "+00000000",
                      //     "state": "ALex"
                      //  },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  log("onSuccess: $params");
                  Navigator.pop(context);
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  debugPrint('cancelled:');
                  Navigator.pop(context);
                },
              ),
            ));
          },
          text: 'Continue',
        );
      },
    );
  }
}
