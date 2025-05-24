import 'package:crowncreation/common/widgets/success_screen/success_screen.dart';
import 'package:crowncreation/features/authentication/screens/login/login.dart';
import 'package:crowncreation/navigation_bar.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Padding to give default equal space on all sides in all screens
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(KImages.deliveredEmailIllustration),
                width: KHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                KTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text(
                'crowncreation.info@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text(
                KTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      () => Get.to(
                        () => SuccessScreen(
                          image: KImages.staticSuccessIllustration,
                          title: KTexts.yourAccountCreatedTitle,
                          subTitle: KTexts.yourAccountCreatedSubTitle,
                          onPressed:
                              () => Get.to(() => const NavigationBarScreen()),
                        ),
                      ),
                  child: Text(
                    KTexts.kContinue,
                    style: TextStyle(color: dark ? Colors.black : Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(KTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
