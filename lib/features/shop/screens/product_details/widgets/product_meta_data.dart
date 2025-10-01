import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/common/widgets/images/k_circular_image.dart';
import 'package:crowncreation/common/widgets/texts/k_brand_title_text_with_verified_icon.dart';
import 'package:crowncreation/common/widgets/texts/product_price_text.dart';
import 'package:crowncreation/common/widgets/texts/product_title_text.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/enums.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KProductMetaData extends StatelessWidget {
  const KProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            // Sale Tag
            KRoundedContainer(
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
            const SizedBox(width: KSizes.spaceBtwItems),

            // Price
            Text(
              '\₹250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: KSizes.sm),
            const KProductPriceText(price: '175', isLarge: true),
            const SizedBox(width: KSizes.spaceBtwItems),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),

        // Title
        const KProductTitleText(title: 'Cake Topper'),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),

        // Stock Status
        Row(
          children: [
            const KProductTitleText(title: 'Status'),
            const SizedBox(width: KSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),

        // Category
        Row(
          children: [
            KCircularImage(
              image: KImages.caketoppers,
              width: 32,
              height: 32,
              overlayColor: dark ? KColors.white : KColors.black,
            ),
            const SizedBox(width: KSizes.sm),
            const KBrandTitleTextWithVerifiedIcon(
              title: 'Cake Toppers',
              brandTextSize: TextSizes.meduim,
            ),
          ],
        ),
      ],
    );
  }
}
