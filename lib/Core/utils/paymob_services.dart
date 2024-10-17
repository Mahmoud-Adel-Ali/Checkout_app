// paymob ui added to checkout app , i will start in paymob logic

import 'dart:developer';

import 'package:checkout_app/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paymob/paymob_payment.dart';

const String paymobApiKey =
    'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBd01EWXlNeXdpYm1GdFpTSTZJbWx1YVhScFlXd2lmUS5DM1Q1c3lPZ1NpODRndUFtM00yMXhKRGF5bWZNUTlfdm1IZS1jTWxpS1lpczBrTDktN3Rwb0ppQVRrcHpvcjRURXpJZkktMkNZcGNYMGVzVjIwUF9kdw==';
const String paymobIframId = '874630';
initialPaymob() {
  return PaymentData.initialize(
    // (Required) getting it from dashboard Select Settings -> Account Info -> API Key
    apiKey: paymobApiKey,
    // (Required) getting it from paymob Select Developers -> iframes
    iframeId: paymobIframId,
    // (Required) getting it from dashboard Select Developers -> Payment Integrations -> Online Card ID
    integrationCardId: "4854149",
    // (Required) getting it from dashboard Select Developers -> Payment Integrations -> Mobile Wallet ID
    integrationMobileWalletId: "4854241",

    // Optional User Data
    // userData: UserData(
    //   email: "User Email", // (Optional) Email | Default: 'NA'
    //   phone: "User Phone", // (Optional) Phone | Default: 'NA'
    //   firstName: "User First Name", // (Optional) First Name | Default: 'NA'
    //   lastName: "User Last Name", // (Optional) Last Name | Default: 'NA'
    // ),

    // Optional Style
    // style: Style(
    //   primaryColor: Colors.blue, // (Optional) Default: Colors.blue
    //   scaffoldColor: Colors.white, // (Optional) Default: Colors.white
    //   appBarBackgroundColor: Colors.blue, // (Optional) Default: Colors.blue
    //   appBarForegroundColor: Colors.white, // (Optional) Default: Colors.white
    //   textStyle: const TextStyle(), // (Optional) Default: TextStyle()
    //   buttonStyle: ElevatedButton.styleFrom(), // (Optional) Default: ElevatedButton.styleFrom(...)
    //   circleProgressColor: Colors.blue, // (Optional) Default: Colors.blue
    //   unselectedColor: Colors.grey, // (Optional) Default: Colors.grey
    //   showMobileWalletIcons: true, // (Optional) Default: true
    // ),
  );
}

makePaymobPayment(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => PaymentView(
              onPaymentSuccess: () {
                // Handle payment success
                log("Payment with Paymob Success");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ThankYouView()));
              },
              onPaymentError: () {
                // Handle payment error
                log("Payment with Paymob Failed");
              },
              price: 100, // (Required) Total Price e.g. 100 => 100 LE
            )),
  );
}
