import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class KSocialButtons extends StatelessWidget {
  const KSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: KColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(KImages.google),
              width: KSizes.iconMd,
              height: KSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: KSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: KColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(KImages.facebook),
              width: KSizes.iconMd,
              height: KSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
