import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KLoginHeader extends StatelessWidget {
  const KLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? KImages.darkAppLogo : KImages.lightAppLogo),
        ),
        Text(
          KTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: KSizes.sm),
        Text(
          KTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
