class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    required this.customerId,
  });

  toJson() {
    int newAmount = int.parse(amount) * 100;
    return {
      'amount': newAmount,
      'currency': currency,
      'customer': customerId,
    };
  }
}
