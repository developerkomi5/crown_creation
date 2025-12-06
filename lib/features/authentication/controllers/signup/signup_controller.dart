import 'package:crowncreation/data/repositories/authentication/authentication_repository.dart';
import 'package:crowncreation/data/repositories/user/user_repository.dart';
import 'package:crowncreation/features/authentication/screens/signup/verify_email.dart';
import 'package:crowncreation/features/personalization/models/user_model.dart';
import 'package:crowncreation/utils/constants/image_strings.dart';
import 'package:crowncreation/utils/helpers/network_manager.dart';
import 'package:crowncreation/utils/popups/full_screen_loader.dart';
import 'package:crowncreation/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  // Signup
  void signup() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog(
        'We are processing your information',
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
      if (!signupFormKey.currentState!.validate()) {
        // remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      // Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // remove Loader
      KFullScreenLoader.stopLoading();

      // Show Success Message
      KLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Your account has been created! Verify email to continue.',
      );

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // remove Loader
      KFullScreenLoader.stopLoading();

      // show some generic error to the user
      KLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
