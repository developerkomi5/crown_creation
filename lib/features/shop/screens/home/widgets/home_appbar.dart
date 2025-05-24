import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class KHomeAppBar extends StatelessWidget {
  const KHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return KAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: KColors.black),
          ),
          Text(
            KTexts.homeAppbarSubtitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: KColors.dark),
          ),
        ],
      ),
      actions: [KCartCounterIcon(onPressed: () {}, iconColor: KColors.black)],
    );
  }
}
