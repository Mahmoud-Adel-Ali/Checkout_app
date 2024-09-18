import 'package:checkout_app/Core/errors/failures.dart';
import 'package:checkout_app/Core/utils/stripe_service.dart';
import 'package:checkout_app/Features/Checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/Features/Checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: 'Payment failed: $e'));
    }
  }
}
