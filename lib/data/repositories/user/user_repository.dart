import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowncreation/features/personalization/models/user_model.dart';
import 'package:crowncreation/utils/exceptions/firebase_exceptions.dart';
import 'package:crowncreation/utils/exceptions/format_exceptions.dart';
import 'package:crowncreation/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  // function to fetch user details based on user ID.

  // function to update user data in firestore.
}
