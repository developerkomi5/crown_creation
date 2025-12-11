import 'package:crowncreation/data/repositories/authentication/authentication_repository.dart';
import 'package:crowncreation/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/helpers/network_manager.dart';
import 'package:crowncreation/utils/popups/full_screen_loader.dart';
import 'package:crowncreation/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
  sendPasswordResetEmail() async {
    try {
      // start loading
      KFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        KImages.loadingAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // remove loader
      KFullScreenLoader.stopLoading();

      // show success screen
      KLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link sent to Reset your Password'.tr,
      );

      // redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // remove loader
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      KFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        KImages.loadingAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove loader
      KFullScreenLoader.stopLoading();

      // show success screen
      KLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link sent to Reset your Password'.tr,
      );
    } catch (e) {
      // remove loader
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
