import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/common/widgets/products/cart/coupon_widget.dart';
import 'package:crowncreation/common/widgets/success_screen/success_screen.dart';
import 'package:crowncreation/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:crowncreation/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:crowncreation/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:crowncreation/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:crowncreation/navigation_bar.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: KAppBar(
        showBackArrorw: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              const KCartItems(showAddRemoveButtons: false),
              const SizedBox(height: KSizes.spaceBtwSections),

              // Coupon TextField
              KCouponCode(),
              const SizedBox(height: KSizes.spaceBtwSections),

              // Billing Section
              KRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(KSizes.md),
                backgroundColor: dark ? KColors.black : KColors.white,
                child: Column(
                  children: [
                    // Pricing
                    KBillingAmountSection(),
                    const SizedBox(height: KSizes.spaceBtwItems),

                    // Divider
                    const Divider(),
                    const SizedBox(height: KSizes.spaceBtwItems),

                    // Payment Methods
                    KBillingPaymentSection(),
                    SizedBox(height: KSizes.spaceBtwItems),

                    // Address
                    KBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  image: KImages.paymentSuccessIllustration,
                  title: 'Payment Success!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed:
                      () => Get.offAll(() => const NavigationBarScreen()),
                ),
              ),
          child: const Text(
            'Checkout \₹256.0',
            style: TextStyle(color: KColors.black),
          ),
        ),
      ),
    );
  }
}
