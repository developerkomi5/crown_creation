import 'package:crowncreation/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:crowncreation/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                  // Attributes
                  // Checkout Button
                  // Description
                  // Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
