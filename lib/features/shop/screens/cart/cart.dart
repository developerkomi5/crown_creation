import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/products/cart/add_remove_button.dart';
import 'package:crowncreation/common/widgets/products/cart/cart_item.dart';
import 'package:crowncreation/common/widgets/texts/product_price_text.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

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
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder:
              (_, __) => const SizedBox(height: KSizes.spaceBtwSections),
          itemBuilder:
              (_, index) => Column(
                children: [
                  const KCartItem(),
                  const SizedBox(height: KSizes.spaceBtwItems),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Extra Space
                          SizedBox(width: 70),
                          // Add Remove Buttons
                          KProductQuantityWithAddRemoveButton(),
                        ],
                      ),
                      KProductPriceText(price: '175'),
                    ],
                  ),
                ],
              ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Checkout \₹256.0'),
        ),
      ),
    );
  }
}
