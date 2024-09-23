import 'package:checkout_app/Core/errors/failures.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
