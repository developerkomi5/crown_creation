import 'package:crowncreation/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get Instance => Get.find();

  // Variables
  final pageController = PageController();
  //now get current page index
  //Rx is the getx method to define variables which can easily changed & which state is going to be changed on the design as well
  //obs is observer which is another widget which is going to change the design without using stateful widget
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Update Current Index & Jump to the next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index & Jump to the last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
