import 'package:crowncreation/common/widgets/loaders/animation_loader.dart';
import 'package:crowncreation/utils/constants/colors.dart';
import 'package:crowncreation/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// A utility class for managing a full screen loading dialog.

class KFullScreenLoader {
  // open a full-screen loading dialog with a given text and animation.
  // this method doesn't return anything.
  // Parameters:
  // - text: The text to be displayed in the loading dialog.
  // - animation: The lottie Animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // the dialog can't be dismissed by tapping outside it
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              color:
                  KHelperFunctions.isDarkMode(Get.context!)
                      ? KColors.dark
                      : KColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  KAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            ),
          ),
    );
  }

  // stop the currently open loading dialog.
  // this method does not return anything.
  static stopLoading() {
    Navigator.of(
      Get.overlayContext!,
    ).pop(); // close the dialog using the navigator
  }
}
