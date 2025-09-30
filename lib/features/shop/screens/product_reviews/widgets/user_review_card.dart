import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/common/widgets/products/rating/rating_indicator.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(KImages.userProfileImage1),
                ),
                const SizedBox(width: KSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: KSizes.spaceBtwItems),

        // Review
        Row(
          children: [
            const KRatingBarIndicator(rating: 4),
            const SizedBox(width: KSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems),
        const ReadMoreText(
          'i ordered this cake topper for my anniversary cake, and i received exact size and design that i want! Thank you so much Crown Creation for sending me this beautiful topper!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: KColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: KColors.primary,
          ),
        ),
        const SizedBox(height: KSizes.spaceBtwItems),

        // Company Review
        KRoundedContainer(
          backgroundColor:
              dark ? KColors.darkerGrey : KColors.grey.withValues(alpha: 0.4),
          child: Padding(
            padding: const EdgeInsets.all(KSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Crown Creation',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov, 2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: KSizes.spaceBtwItems),
                const ReadMoreText(
                  'Thank you for the brightening 5 stars.We are delighted to hear the kind words of appreciation and Assuring you of similar experience in future orders too.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: KColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: KColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: KSizes.spaceBtwSections),
      ],
    );
  }
}
