import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/common/widgets/icons/k_circular_icon.dart';
import 'package:crowncreation/common/widgets/images/k_rounded_image.dart';
import 'package:crowncreation/common/widgets/texts/k_brand_title_text_with_verified_icon.dart';
import 'package:crowncreation/common/widgets/texts/product_price_text.dart';
import 'package:crowncreation/common/widgets/texts/product_title_text.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KProductCardHorizontal extends StatelessWidget {
  const KProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KSizes.productImageRadius),
        color: dark ? KColors.darkerGrey : KColors.lightContainer,
      ),
      child: Row(
        children: [
          // Thumbnail
          KRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(KSizes.sm),
            backgroundColor: dark ? KColors.dark : KColors.light,
            child: Stack(
              children: [
                // Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: KRoundedImage(
                    imageUrl: KImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                // Sale Tag
                Positioned(
                  top: 12,
                  child: KRoundedContainer(
                    radius: KSizes.sm,
                    backgroundColor: KColors.primary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: KSizes.sm,
                      vertical: KSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: KColors.black),
                    ),
                  ),
                ),

                // Favorite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: KCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          // Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: KSizes.sm, left: KSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KProductTitleText(
                        title: 'Specialized Cake Topper',
                        smallSize: true,
                      ),
                      SizedBox(height: KSizes.spaceBtwItems / 2),
                      KBrandTitleTextWithVerifiedIcon(title: 'Cake Topper'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pricing
                      Flexible(child: const KProductPriceText(price: '256.0')),

                      // Add to cart button
                      Container(
                        decoration: const BoxDecoration(
                          color: KColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(KSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              KSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: const SizedBox(
                          width: KSizes.iconLg * 1.2,
                          height: KSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: KColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
