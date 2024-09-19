class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });

  toJson() {
    int newAmount = int.parse(amount) * 100;
    return {
      'amount': newAmount,
      'currency': currency,
    };
  }
}
