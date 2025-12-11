import 'package:crowncreation/data/repositories/authentication/authentication_repository.dart';
import 'package:crowncreation/features/personalization/controllers/user_controller.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/helpers/network_manager.dart';
import 'package:crowncreation/utils/popups/full_screen_loader.dart';
import 'package:crowncreation/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    //password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email & password signin
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      KFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        KImages.loadingAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      // save data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user using email & password authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // save user record
      await userController.saveUserRecord(userCredentials);

      // remove loader
      KFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Google Signin Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        KImages.loadingAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // save user record
      await userController.saveUserRecord(userCredentials);

      // remove loader
      KFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
