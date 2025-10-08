import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KBillingPaymentSection extends StatelessWidget {
  const KBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        KSectionHeading(
          title: 'Payment Method',
          textColor: dark ? KColors.primary : KColors.black,
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 2),
        Row(
          children: [
            KRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? KColors.light : KColors.white,
              padding: const EdgeInsets.all(KSizes.sm),
              child: const Image(
                image: AssetImage(KImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: KSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
