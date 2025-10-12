import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/appbar/tabbar.dart';
import 'package:crowncreation/common/widgets/categories/category_type_card.dart';
import 'package:crowncreation/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:crowncreation/common/widgets/layouts/grid_layout.dart';
import 'package:crowncreation/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/features/shop/screens/categories/widgets/category_tab.dart';
import 'package:crowncreation/features/shop/screens/category/category_products.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        // Appbar
        appBar: KAppBar(
          title: Text(
            'Category',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [KCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          // Header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    KHelperFunctions.isDarkMode(context)
                        ? KColors.black
                        : KColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(KSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Search Bar
                      const SizedBox(height: KSizes.spaceBtwItems),
                      KSearchContainer(
                        text: 'Search in Categories',
                        textColor: dark ? KColors.white : KColors.dark,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                        showBackground: false,
                      ),
                      const SizedBox(height: KSizes.spaceBtwSections),

                      // Featured Products
                      KSectionHeading(
                        title: 'Featured Products',
                        textColor: dark ? KColors.white : KColors.dark,
                        onPressed: () => Get.to(() => const CategoryProducts()),
                      ),
                      const SizedBox(height: KSizes.spaceBtwItems / 1.5),

                      // Category Grid
                      KGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          // Brand_card
                          // in backend we will pass each brand/product types & onPress event also
                          return const KCategoryTypeCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),
                // Tabs
                bottom: const KTabBar(
                  tabs: [
                    Tab(child: Text('Cake Toppers')),
                    Tab(child: Text('Gate Design')),
                    Tab(child: Text('Gift Items')),
                    Tab(child: Text('Keychains')),
                    Tab(child: Text('Photo Frames')),
                    Tab(child: Text('Rings Decor')),
                    Tab(child: Text('Valentine Item')),
                    Tab(child: Text('Wall Clocks')),
                    Tab(child: Text('Wedding Decor')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              KCategoryTab(),
              KCategoryTab(),
              KCategoryTab(),
              KCategoryTab(),
              KCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
