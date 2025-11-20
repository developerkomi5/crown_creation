import 'package:crowncreation/features/authentication/screens/login/login.dart';
import 'package:crowncreation/features/authentication/screens/onboarding/onboarding.dart';
import 'package:crowncreation/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:crowncreation/utils/exceptions/firebase_exceptions.dart';
import 'package:crowncreation/utils/exceptions/format_exceptions.dart';
import 'package:crowncreation/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again!';
    }
  }

  // [ReAuthenticate] - Reauthenticate User

  // [EmailVerification] - MAIL VERFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // [Email-authentication] - Forget Password

  // Federated identity & social signin

  // [GoogleAuthentication] - Google

  // [FacebookAuthentication] - Facebook

  // ./end Federated identity & social signin

  // [LogoutUser] - Valid for any authentication

  // Delete User - Remove user auth and firestore account
}
