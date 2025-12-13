import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

enum ImageType { profile, product, banner, generic }

class ImageUploadService {
  ImageUploadService._();
  static final ImageUploadService instance = ImageUploadService._();

  /// Public method used everywhere in the app
  Future<String?> pickCompressAndUpload({
    required ImageType type,
    required String storagePath,
  }) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked == null) return null;

    final compressed = await _compressImage(File(picked.path), type);

    if (compressed == null) return null;

    return _uploadImage(compressed, storagePath);
  }

  /// 🔒 PRIVATE METHODS BELOW

  Future<File?> _compressImage(File file, ImageType type) async {
    final dir = await getTemporaryDirectory();
    final targetPath =
        '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Different rules per image type
    int quality;
    int minWidth;
    int minHeight;

    switch (type) {
      case ImageType.profile:
        quality = 20;
        minWidth = 300;
        minHeight = 300;
        break;

      case ImageType.product:
        quality = 25;
        minWidth = 800;
        minHeight = 800;
        break;

      case ImageType.banner:
        quality = 30;
        minWidth = 1200;
        minHeight = 600;
        break;

      case ImageType.generic:
        quality = 25;
        minWidth = 600;
        minHeight = 600;
    }

    final XFile? compressedXFile =
        await FlutterImageCompress.compressAndGetFile(
          file.absolute.path,
          targetPath,
          quality: quality,
          minWidth: minWidth,
          minHeight: minHeight,
          format: CompressFormat.jpeg,
        );
    if (compressedXFile == null) return null;

    return File(compressedXFile.path);
  }

  Future<String> _uploadImage(File image, String path) async {
    final ref = FirebaseStorage.instance
        .ref(path)
        .child(image.path.split('/').last);

    await ref.putFile(image);
    return await ref.getDownloadURL();
  }
}
