import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/images/k_rounded_image.dart';
import 'package:crowncreation/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const KAppBar(title: Text('Gifting Items'), showBackArrorw: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              KRoundedImage(
                imageUrl: KImages.banner1,
                applyImageRadius: true,
                width: double.infinity,
              ),
              SizedBox(height: KSizes.spaceBtwSections),

              // Sub-Categories
              Column(
                children: [
                  // Heading
                  KSectionHeading(
                    title: 'Cake Toppers',
                    onPressed: () {},
                    textColor: dark ? KColors.white : KColors.black,
                  ),
                  const SizedBox(height: KSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(width: KSizes.spaceBtwItems),
                      itemBuilder:
                          (context, index) => const KProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
