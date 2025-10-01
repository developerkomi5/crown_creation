import 'package:crowncreation/common/widgets/chips/choice_chip.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Attributes
          children: [
            KSectionHeading(
              title: 'Colors',
              showActionButton: false,
              textColor: dark ? KColors.white : KColors.black,
            ),
            const SizedBox(height: KSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                KChoiceChip(
                  text: 'Black',
                  selected: true,
                  onSelected: (value) {},
                ),
                KChoiceChip(
                  text: 'Golden',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),

            const SizedBox(height: KSizes.spaceBtwItems),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KSectionHeading(
                  title: 'Size',
                  showActionButton: false,
                  textColor: dark ? KColors.white : KColors.black,
                ),
                const SizedBox(height: KSizes.spaceBtwItems / 2),
                Wrap(
                  spacing: 8,
                  children: [
                    KChoiceChip(
                      text: '2*2',
                      selected: true,
                      onSelected: (value) {},
                    ),

                    KChoiceChip(
                      text: '4*4',
                      selected: false,
                      onSelected: (value) {},
                    ),
                  ],
                ),
                const SizedBox(height: KSizes.spaceBtwItems),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
