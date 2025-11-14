import 'package:crowncreation/features/authentication/screens/login/login.dart';
import 'package:crowncreation/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();

  // called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // function to show relevant screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print('================ GET STORAGE AUTH REPO ================');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  // email & password signin

  // [Email-authentication] - Signin

  // [Email-authentication] - Register

  // [ReAuthenticate] - Reauthenticate User

  // [EmailVerification] - MAIL VERFICATION

  // [Email-authentication] - Forget Password

  // Federated identity & social signin

  // [GoogleAuthentication] - Google

  // [FacebookAuthentication] - Facebook

  // ./end Federated identity & social signin

  // [LogoutUser] - Valid for any authentication

  // Delete User - Remove user auth and firestore account
}
