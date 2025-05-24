import 'package:crowncreation/common/widgets/categories/category_show_case.dart';
import 'package:crowncreation/common/widgets/layouts/grid_layout.dart';
import 'package:crowncreation/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class KCategoryTab extends StatelessWidget {
  const KCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Categories
              const KCategoryShowcase(
                images: [
                  KImages.caketoppers,
                  KImages.wallclocks,
                  KImages.keychain,
                ],
              ),
              const KCategoryShowcase(
                images: [
                  KImages.caketoppers,
                  KImages.wallclocks,
                  KImages.keychain,
                ],
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              // Products
              KSectionHeading(title: 'You Might Like', onPressed: () {}),
              const SizedBox(height: KSizes.spaceBtwItems),

              //to display the products
              KGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const KProductCardVertical(),
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
