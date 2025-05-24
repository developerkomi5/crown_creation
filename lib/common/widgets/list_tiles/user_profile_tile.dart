import 'package:crowncreation/common/widgets/images/k_circular_image.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KUserProfileTile extends StatelessWidget {
  const KUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return ListTile(
      leading: const KCircularImage(
        image: KImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Crown creation',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
          color: dark ? KColors.light : KColors.dark,
        ),
      ),
      subtitle: Text(
        'crowncreation.info@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium!.apply(
          color: dark ? KColors.light : KColors.dark,
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.edit, color: dark ? KColors.light : KColors.dark),
      ),
    );
  }
}
