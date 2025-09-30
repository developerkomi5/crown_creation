import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/products/rating/rating_indicator.dart';
import 'package:crowncreation/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:crowncreation/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: KAppBar(title: Text('Reviews & Ratings'), showBackArrorw: true),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ratings and reviews are verifies and are from people who use the same type of product that you use.',
              ),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Overall Product Ratings
              const KOverallProductRating(),

              const KRatingBarIndicator(rating: 3.5),

              Text('559', style: Theme.of(context).textTheme.bodySmall),

              const SizedBox(height: KSizes.spaceBtwSections),

              // user review list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
