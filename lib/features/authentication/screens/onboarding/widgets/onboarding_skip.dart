import 'package:crowncreation/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:crowncreation/utils/constants/sizes.dart';
import 'package:crowncreation/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: KDeviceUtils.getAppBarHeight(),
      right: KSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.Instance.skipPage(),
        child: const Text('Skip', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
