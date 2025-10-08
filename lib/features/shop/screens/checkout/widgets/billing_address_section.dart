import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KBillingAddressSection extends StatelessWidget {
  const KBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KSectionHeading(
          title: 'Shipping Address',
          textColor: dark ? KColors.primary : KColors.black,
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Komal Buddhdev', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: KSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: KSizes.spaceBtwItems),
            Text(
              '+91 94096 11997',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: KSizes.spaceBtwItems),
            Expanded(
              child: Text(
                'Aditya Park, Gulabnagar road, Jamnagar 361007 - Gujarat',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
