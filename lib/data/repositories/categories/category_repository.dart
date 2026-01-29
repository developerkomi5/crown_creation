import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowncreation/data/services/firebase_storage_service.dart';
import 'package:crowncreation/features/shop/models/category_model.dart';
import 'package:crowncreation/utils/exceptions/firebase_exceptions.dart';
import 'package:crowncreation/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  // Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list =
          snapshot.docs
              .map((document) => CategoryModel.fromSnapshot(document))
              .toList();
      return list;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Pkease try again.';
    }
  }

  // Get Sub Categories

  // Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // upload all the categories along with their image
      final storage = Get.put(KFirebaseStorageService());

      // loop through each category
      for (var category in categories) {
        // get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // upload image and get its URL
        final url = await storage.uploadImageData(
          'Categories',
          file,
          category.name,
        );

        // assign URL to category.imge attribute
        category.image = url;

        // store category in firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
