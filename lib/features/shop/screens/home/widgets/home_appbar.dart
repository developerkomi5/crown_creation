import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:crowncreation/features/personalization/controllers/user_controller.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/shimmer.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KHomeAppBar extends StatelessWidget {
  const KHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(UserController());
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
          Obx(() {
            if (contoller.profileLoading.value) {
              // display shimmer loader while user profile is being loaded
              return const KShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                contoller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: KColors.dark),
              );
            }
          }),
        ],
      ),
      actions: [KCartCounterIcon(onPressed: () {}, iconColor: KColors.black)],
    );
  }
}
