import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KSingleAddress extends StatelessWidget {
  const KSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return KRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(KSizes.md),
      backgroundColor:
          selectedAddress
              ? KColors.primary.withOpacity(0.8)
              : Colors.transparent,
      borderColor:
          selectedAddress
              ? Colors.transparent
              : dark
              ? KColors.darkerGrey
              : KColors.grey,
      margin: const EdgeInsets.only(bottom: KSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color:
                  selectedAddress
                      ? dark
                          ? KColors.light
                          : KColors.dark
                      : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Komal Buddhdev',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: KSizes.sm / 2),
              const Text(
                '(+91) 94096 11997',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: KSizes.sm / 2),
              Text(
                '58/1, "Brahma Sanniddhi", Aditya Park strret no.2, gulabnagar road, Jamnagar - 361007',
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
