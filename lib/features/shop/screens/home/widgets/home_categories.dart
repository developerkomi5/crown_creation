import 'package:crowncreation/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:crowncreation/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KHomeCategories extends StatelessWidget {
  const KHomeCategories({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return KVerticalImageText(
            image: KImages.giftsitems,
            title: 'Gifts',
            onTap: () => Get.to(() => SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
