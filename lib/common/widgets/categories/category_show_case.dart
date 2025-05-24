import 'package:crowncreation/common/widgets/categories/category_type_card.dart';
import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KCategoryShowcase extends StatelessWidget {
  const KCategoryShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return KRoundedContainer(
      showBorder: true,
      borderColor: KColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(KSizes.md),
      margin: const EdgeInsets.only(bottom: KSizes.spaceBtwItems),
      child: Column(
        children: [
          // Category with Product Count
          const KCategoryTypeCard(showBorder: false),
          const SizedBox(height: KSizes.spaceBtwItems),
          // Category Top 3 Product Image
          Row(
            children:
                images
                    .map(
                      (image) => categoryTopProductImageWidget(image, context),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}

Widget categoryTopProductImageWidget(String image, context) {
  return Expanded(
    child: KRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(KSizes.md),
      margin: const EdgeInsets.only(right: KSizes.sm),
      backgroundColor:
          KHelperFunctions.isDarkMode(context)
              ? KColors.darkerGrey
              : KColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
