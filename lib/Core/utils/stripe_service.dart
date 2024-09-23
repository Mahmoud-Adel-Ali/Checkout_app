import 'package:checkout_app/Core/utils/api_keys.dart';
import 'package:checkout_app/Core/utils/api_service.dart';
import 'package:checkout_app/Features/Checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/inti_payment_sheet_input_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService api = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await api.post(
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        merchantDisplayName: 'Mahmoud Adel',
        customerId: initPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        style: ThemeMode.light,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    // 1. create payment intent
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralkey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      customerId: paymentIntentInputModel.customerId,
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    // Integrate the payment sheet(paymentIntentClientSecret)
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    // present the payment sheet
    await displayPaymentSheet();
  }

  Future<PaymentIntentModel> createCustom(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await api.post(
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/customers',
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralkey(
      {required String customerId}) async {
    var response = await api.post(
        body: {
          'customer': customerId,
        },
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-06-20',
        });

    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
