import 'package:cached_network_image/cached_network_image.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/common/widgets/shimmer/shimmer.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KCircularImage extends StatelessWidget {
  const KCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = KSizes.sm,
    this.fit = BoxFit.cover,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.isNetworkImage = true,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // if image background color is null then switch it to light and dark mode color design
        color:
            backgroundColor ??
            (KHelperFunctions.isDarkMode(context)
                ? KColors.black
                : KColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(100),
        child: Center(
          child:
              isNetworkImage
                  ? CachedNetworkImage(
                    imageUrl: image,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const KShimmerEffect(width: 55, height: 55),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  )
                  : Image(
                    fit: fit,
                    image: AssetImage(image),
                    color: overlayColor,
                  ),
        ),
      ),
    );
  }
}
