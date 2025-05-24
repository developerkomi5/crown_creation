import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/device/device_utility.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class KTabBar extends StatelessWidget implements PreferredSizeWidget {
  // if you want to add bgcolor to tabs you have to wrap them in Material Widget
  // to do that we need [PreferredSized] Widget and that's why created custom class [PreferredSizeWidget]
  const KTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? KColors.black : KColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: KColors.primary,
        unselectedLabelColor: KColors.darkGrey,
        labelColor: dark ? KColors.white : KColors.black,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
}
