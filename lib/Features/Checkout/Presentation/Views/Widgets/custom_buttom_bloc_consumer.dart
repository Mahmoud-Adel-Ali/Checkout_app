import 'dart:developer';

import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Core/enums/payment_type.dart';
import 'package:checkout_app/Core/utils/api_keys.dart';
import 'package:checkout_app/Core/utils/functions/show_snak_bar_message.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:checkout_app/Features/Checkout/Presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:checkout_app/Features/Checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/amount_model/details.dart';
import 'package:checkout_app/Features/Checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/item_list_model/order_item_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({
    super.key,
    required this.paymentType,
  });
  final PaymentType paymentType;
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
            if (paymentType == PaymentType.creditCard) {
              paymentWithCard(context);
            } else if (paymentType == PaymentType.paypal) {
              paymentWithPaypal(context);
            }
            if (paymentType == PaymentType.applePay) {
              Navigator.pop(context);
              showSnakBarMessage(context,
                  msg: 'InValid now , try other payment type');
            }
          },
          text: 'Continue',
        );
      },
    );
  }

  void paymentWithPaypal(BuildContext context) {
    var transctionsData = getTransctionsData();
    exceuteePaypalPayment(context, transctionsData);
  }

  void paymentWithCard(BuildContext context) {
    context.read<PaymentCubit>().makePayment(
          paymentIntentInputModel: PaymentIntentInputModel(
            amount: '100',
            currency: 'USD',
            customerId: 'cus_QsXJYf3W0UeU4U',
          ),
        );
  }

  void exceuteePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.payPalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ThankYouView()));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onCancel: () {
          debugPrint('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransctionsData() {
    var amount = AmountModel(
        total: "100",
        currency: "USD",
        details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0));

    List<OrderItemModel> orders = [
      OrderItemModel(
        name: "Apple",
        quantity: 4,
        price: "10",
        currency: "USD",
      ),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: "12",
        currency: "USD",
      )
    ];
    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
