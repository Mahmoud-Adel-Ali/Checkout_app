import 'package:checkout_app/Core/Widgets/custom_buttom.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/custom_credit_card.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/Widgets/payment_methods_list_view.dart';
import 'package:checkout_app/Features/Checkout/Presentation/Views/thank_you_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 25)),
          SliverToBoxAdapter(
              child: CustomCreditCard(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const Expanded(child: SizedBox(height: 25)),
                CustomButtom(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ThankYouView()));
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    text: 'Pay'),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
