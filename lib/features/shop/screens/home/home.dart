import 'package:crowncreation/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:crowncreation/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:crowncreation/common/widgets/layouts/grid_layout.dart';
import 'package:crowncreation/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:crowncreation/features/shop/screens/home/widgets/home_categories.dart';
import 'package:crowncreation/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            const KPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  KHomeAppBar(),
                  SizedBox(height: KSizes.spaceBtwSections),

                  // Searchbar
                  KSearchContainer(text: 'Search in Store'),
                  SizedBox(height: KSizes.spaceBtwSections),

                  // Categories
                  Padding(
                    padding: EdgeInsets.only(left: KSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        KSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(height: KSizes.spaceBtwItems),

                        // Category
                        KHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(KSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider
                  const KPromoSlider(
                    banners: [
                      KImages.banner1,
                      KImages.banner2,
                      KImages.banner3,
                      KImages.banner4,
                      KImages.banner5,
                    ],
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  // Heading
                  KSectionHeading(title: 'Popular Products', onPressed: () {}),
                  const SizedBox(height: KSizes.spaceBtwItems),

                  // Popular Products
                  KGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const KProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
