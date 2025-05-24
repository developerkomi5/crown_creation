import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KCircularIcon extends StatelessWidget {
  // A custom circular icon widget with background color
  // Properties are:
  // Container [width], [height], [backgroundcolor]
  // Icon's [size], [color], [onPressed]

  const KCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = KSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:
            backgroundColor != null
                ? backgroundColor!
                : KHelperFunctions.isDarkMode(context)
                ? KColors.black.withOpacity(0.9)
                : KColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
