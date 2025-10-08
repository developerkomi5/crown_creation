import 'package:crowncreation/common/widgets/products/cart/add_remove_button.dart';
import 'package:crowncreation/common/widgets/products/cart/cart_item.dart';
import 'package:crowncreation/common/widgets/texts/product_price_text.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class KCartItems extends StatelessWidget {
  const KCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder:
          (_, __) => const SizedBox(height: KSizes.spaceBtwSections),
      itemBuilder:
          (_, index) => Column(
            children: [
              // Cart Item
              const KCartItem(),
              if (showAddRemoveButtons)
                const SizedBox(height: KSizes.spaceBtwItems),

              // Add remove button row with total price
              if (showAddRemoveButtons)
                const Row(
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
    );
  }
}
