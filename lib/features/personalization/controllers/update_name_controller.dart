import 'package:crowncreation/data/repositories/user/user_repository.dart';
import 'package:crowncreation/features/personalization/controllers/user_controller.dart';
import 'package:crowncreation/features/personalization/screens/profile/profile.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/helpers/network_manager.dart';
import 'package:crowncreation/utils/popups/full_screen_loader.dart';
import 'package:crowncreation/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start loading
      KFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        KImages.loadingAnimation,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // update user's first and last name in the firebase firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      KFullScreenLoader.stopLoading();

      // show success message
      KLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated.',
      );

      // Move to previous screen
      Get.offAll(() => const ProfileScreen());
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
