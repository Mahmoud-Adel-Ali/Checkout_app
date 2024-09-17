import 'package:checkout_app/Core/utils/api_keys.dart';
import 'package:checkout_app/Core/utils/api_service.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService api = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await api.post(
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      url: 'https://api.stripe.com/v1/payment_intents',
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Mahmoud Adel',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentCustomerSheet();
  }

  Future makePayment()async{}
}
