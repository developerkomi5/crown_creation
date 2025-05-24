import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/common/widgets/images/k_circular_image.dart';
import 'package:crowncreation/common/widgets/texts/k_brand_title_text_with_verified_icon.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/enums.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KCategoryTypeCard extends StatelessWidget {
  const KCategoryTypeCard({super.key, this.onTap, required this.showBorder});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = KHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      // Container Design
      child: KRoundedContainer(
        padding: const EdgeInsets.all(KSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: KCircularImage(
                image: KImages.caketoppers,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? KColors.white : KColors.black,
              ),
            ),
            const SizedBox(width: KSizes.spaceBtwItems / 2),

            // Text
            // [Expanded] & Column [MainAxisSize.min] is important to keep
            // elements in the vertical center and also to keep text inside boundaries
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KBrandTitleTextWithVerifiedIcon(
                    title: 'Cake Toppers',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
