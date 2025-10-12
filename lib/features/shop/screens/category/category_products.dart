import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/categories/category_type_card.dart';
import 'package:crowncreation/common/widgets/products/sortable/sortable_products.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KAppBar(title: Text('Cake Toppers')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Category Detail
              KCategoryTypeCard(showBorder: true),
              SizedBox(height: KSizes.spaceBtwSections),

              KSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
