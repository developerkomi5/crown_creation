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
  screenRedirect() async {}

  // email & password signin

  // [Email-authentication] - Signin

  // [Email-authentication] - Register

  // [ReAuthenticate] - Reauthenticate User

  // [EmailVerification] - MAIL VERFICATION

  // [Email-authentication] - Forget Password
}
