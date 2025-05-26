import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/device/device_utility.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KSearchContainer extends StatelessWidget {
  const KSearchContainer({
    super.key,
    this.textColor,
    required this.text,
    this.icon = Iconsax.search_normal_1,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: KSizes.defaultSpace),
  });

  final String text;
  final Color? textColor;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: KDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(KSizes.md),
          decoration: BoxDecoration(
            color:
                showBackground
                    ? dark
                        ? KColors.light
                        : KColors.light
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
            border:
                showBorder
                    ? Border.all(color: dark ? KColors.white : KColors.dark)
                    : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: KColors.darkerGrey),
              const SizedBox(width: KSizes.spaceBtwItems),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? (dark ? KColors.dark : KColors.dark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
