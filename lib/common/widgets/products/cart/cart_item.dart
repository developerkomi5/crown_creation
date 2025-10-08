import 'package:crowncreation/common/widgets/images/k_rounded_image.dart';
import 'package:crowncreation/common/widgets/texts/k_brand_title_text_with_verified_icon.dart';
import 'package:crowncreation/common/widgets/texts/product_title_text.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KCartItem extends StatelessWidget {
  const KCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        KRoundedImage(
          imageUrl: KImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(KSizes.sm),
          backgroundColor:
              KHelperFunctions.isDarkMode(context)
                  ? KColors.darkerGrey
                  : KColors.light,
        ),
        const SizedBox(width: KSizes.spaceBtwItems),

        // Title, Prize & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const KBrandTitleTextWithVerifiedIcon(title: 'Cake Topper'),
              const Flexible(
                child: KProductTitleText(
                  title: 'Specialized Cake Topper',
                  maxLines: 1,
                ),
              ),
              // Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    TextSpan(
                      text: 'Black',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: '2*2',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
