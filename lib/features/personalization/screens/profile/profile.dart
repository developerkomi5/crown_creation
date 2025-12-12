import 'package:crowncreation/common/widgets/appbar/appbar.dart';
import 'package:crowncreation/common/widgets/images/k_circular_image.dart';
import 'package:crowncreation/common/widgets/texts/section_heading.dart';
import 'package:crowncreation/features/personalization/controllers/user_controller.dart';
import 'package:crowncreation/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:crowncreation/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: KAppBar(showBackArrorw: true, title: Text('Profile')),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const KCircularImage(
                      image: KImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: KSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Heading Profile Info
              const KSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: KSizes.spaceBtwItems),

              KProfileMenu(
                onPressed: () => Get.to(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              KProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),

              const SizedBox(height: KSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Heading Personal Info
              const KSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: KSizes.spaceBtwItems),

              KProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              KProfileMenu(
                onPressed: () {},
                title: 'E-Mail',
                value: controller.user.value.email,
              ),
              KProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              KProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              KProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '17 - 09 - 2000',
              ),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
