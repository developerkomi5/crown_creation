import 'package:crowncreation/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class KHomeCategories extends StatelessWidget {
  const KHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90, // Slightly increased height for better spacing
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 16), // Uniform padding
        separatorBuilder:
            (_, __) => const SizedBox(width: 12), // gap between items
        itemBuilder: (_, index) {
          return KVerticalImageText(
            image: KImages.giftsitems,
            title: 'Gifts',
            onTap: () {},
          );
        },
      ),
    );
  }
}
