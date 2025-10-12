import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/categories/category_type_card.dart';
import 'package:crowncreation/common/widgets/layouts/grid_layout.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/features/shop/screens/category/category_products.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(title: Text('Category'), showBackArrorw: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              const KSectionHeading(
                title: 'Categories',
                showActionButton: false,
              ),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Categories
              KGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder:
                    (context, index) => KCategoryTypeCard(
                      showBorder: true,
                      onTap: () => Get.to(() => const CategoryProducts()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
