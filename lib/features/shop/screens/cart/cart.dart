import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:crowncreation/features/shop/screens/checkout/checkout.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        showBackArrorw: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),

        // items in cart
        child: KCartItems(),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text(
            'Checkout \₹256.0',
            style: TextStyle(color: KColors.black),
          ),
        ),
      ),
    );
  }
}
