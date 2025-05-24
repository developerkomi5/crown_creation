import 'package:crowncreation/features/authentication/controllers/onboarding_controller.dart';
import 'package:crowncreation/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:crowncreation/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:crowncreation/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:crowncreation/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      // Pageview is for pages to swipe
      //stack is for stack/layout elements on top of each other
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: KImages.onBoardingImage1,
                title: KTexts.onBoardingTitle1,
                subTitle: KTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: KImages.onBoardingImage2,
                title: KTexts.onBoardingTitle2,
                subTitle: KTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: KImages.onBoardingImage3,
                title: KTexts.onBoardingTitle3,
                subTitle: KTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
