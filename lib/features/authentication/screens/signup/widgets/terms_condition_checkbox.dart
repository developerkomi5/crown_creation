import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KTermsandConditionsCheckbox extends StatelessWidget {
  const KTermsandConditionsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
            checkColor: Colors.black,
          ),
        ),
        const SizedBox(width: KSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${KTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: KTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? KColors.white : KColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? KColors.white : KColors.primary,
                ),
              ),
              TextSpan(
                text: ' & ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: 'Terms',
                style: Theme.of(context).textTheme.bodySmall!.apply(
                  color: dark ? KColors.white : KColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? KColors.white : KColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
