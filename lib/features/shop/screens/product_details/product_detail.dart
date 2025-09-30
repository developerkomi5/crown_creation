import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:crowncreation/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:crowncreation/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:crowncreation/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:crowncreation/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: KBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1 - Product Image Slider
            const KProductImageSlider(),

            // 2 - Product Details
            Padding(
              padding: const EdgeInsetsGeometry.only(
                right: KSizes.defaultSpace,
                left: KSizes.defaultSpace,
                bottom: KSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Rating & Share
                  KRatingAndShare(),

                  // Price, Title, Stock & Category
                  KProductMetaData(),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  // Description
                  const KSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is the cake topper that are placed on the birthday cakes, anninversary cakes and many more, you just need to customise the text and size of the topper and you are good to go!',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: KSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const KSectionHeading(
                        title: 'Reviews(89)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed:
                            () => Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
