import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/features/personalization/screens/address/add_new_address.dart';
import 'package:crowncreation/features/personalization/screens/address/widgets/single_address.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: KColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: KColors.black),
      ),
      appBar: KAppBar(
        showBackArrorw: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(KSizes.defaultSpace),
          child: Column(
            children: [
              KSingleAddress(selectedAddress: true),
              KSingleAddress(selectedAddress: false),
              KSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
