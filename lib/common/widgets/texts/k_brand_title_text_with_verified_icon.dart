import 'package:crowncreation/common/widgets/texts/k_brand_title_text.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/enums.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const KBrandTitleTextWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = KColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: KBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: KSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: KSizes.iconXs),
      ],
    );
  }
}
