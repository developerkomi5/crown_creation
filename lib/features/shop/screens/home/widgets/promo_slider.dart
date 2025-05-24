import 'package:carousel_slider/carousel_slider.dart';
import 'package:crowncreation/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crowncreation/common/widgets/images/k_rounded_image.dart';
import 'package:crowncreation/features/shop/controllers/home_controller.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KPromoSlider extends StatelessWidget {
  const KPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => KRoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: KSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  KCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor:
                        controller.carouselCurrentIndex.value == i
                            ? KColors.primary
                            : KColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
