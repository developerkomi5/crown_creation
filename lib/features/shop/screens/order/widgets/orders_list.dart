import 'package:crowncreation/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KOrderListItems extends StatelessWidget {
  const KOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: KSizes.spaceBtwItems),
      itemBuilder:
          (_, index) => KRoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(KSizes.md),
            backgroundColor: dark ? KColors.dark : KColors.light,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row 1
                Row(
                  children: [
                    // 1 - Icon
                    const Icon(Iconsax.ship),
                    const SizedBox(width: KSizes.spaceBtwItems / 2),

                    // 2 - Status & Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: KColors.primary,
                              fontWeightDelta: 1,
                            ),
                          ),
                          Text(
                            '07 Nov 2025',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    // 3 - Icon
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_34,
                        size: KSizes.iconSm,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: KSizes.spaceBtwItems),

                // Row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          // 1 - Icon
                          const Icon(Iconsax.tag),
                          const SizedBox(width: KSizes.spaceBtwItems / 2),

                          // 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  '[#256f2]',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          // 1 - Icon
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: KSizes.spaceBtwItems / 2),

                          // 2 - Status & Date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  '15 Nov 2025',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
