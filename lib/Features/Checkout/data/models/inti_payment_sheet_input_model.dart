class InitPaymentSheetInputModel {
  final String customerId;
  final String clientSecret;
  final String ephemeralKeySecret;

  InitPaymentSheetInputModel({
    required this.customerId,
    required this.clientSecret,
    required this.ephemeralKeySecret,
  });
}
