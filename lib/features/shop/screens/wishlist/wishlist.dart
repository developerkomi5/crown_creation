import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/icons/k_circular_icon.dart';
import 'package:crowncreation/common/widgets/layouts/grid_layout.dart';
import 'package:crowncreation/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:crowncreation/features/shop/screens/home/home.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          KCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              KGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const KProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
