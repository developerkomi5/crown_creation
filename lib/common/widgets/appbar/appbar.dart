import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    super.key,
    this.title,
    this.showBackArrorw = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrorw;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading:
            showBackArrorw
                ? IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Iconsax.arrow_left),
                )
                : leadingIcon != null
                ? IconButton(
                  onPressed: () => leadingOnPressed,
                  icon: Icon(leadingIcon),
                )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
}
