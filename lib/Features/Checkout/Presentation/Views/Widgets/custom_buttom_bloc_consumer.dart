import 'dart:developer';

import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Core/utils/functions/show_snak_bar_message.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:checkout_app/Features/Checkout/Presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:checkout_app/Features/Checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/amount_model/details.dart';
import 'package:checkout_app/Features/Checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/item_list_model/order_item_model.dart';
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

            var transctionsData = getTransctionsData();

            exceuteePaypalPayment(context, transctionsData);
          },
          text: 'Continue',
        );
      },
    );
  }

  void exceuteePaypalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "YOUR CLIENT ID",
        secretKey: "YOUR SECRET KEY",
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
