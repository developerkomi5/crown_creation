import 'package:flutter/material.dart';
import 'package:crowncreation/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';

class KHomeCategories extends StatelessWidget {
  const KHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Ensures enough height for image + text
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 70, // FORCE every item to take same space
            child: KVerticalImageText(
              image: KImages.giftsitems,
              title: 'Gifts',
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
