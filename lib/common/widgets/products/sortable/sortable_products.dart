import 'package:crowncreation/common/widgets/layouts/grid_layout.dart';
import 'package:crowncreation/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KSortableProducts extends StatelessWidget {
  const KSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (option) =>
                        DropdownMenuItem(child: Text(option), value: option),
                  )
                  .toList(),
          onChanged: (value) {},
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(height: KSizes.spaceBtwSections),
        // Products
        KGridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => const KProductCardVertical(),
        ),
      ],
    );
  }
}
