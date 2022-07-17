import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dating_app/repositories/repositories.dart';
import 'package:image_picker/image_picker.dart';

class StorageRepository extends BaseStorageRepository {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Future<void> uploadImage(XFile image) async {
    try {
      await firebaseStorage
          .ref('user_1/${image.name}')
          .putFile(File(image.path))
          .then(
            (p0) => DatabaseRepository().updateUserPictures(image.name),
          );
    } catch (_) {}
  }

  @override
  Future<String> getDownloadUrl(String imageName) async {
    String downloadUrl =
        await firebaseStorage.ref('user_1/$imageName').getDownloadURL();

    return downloadUrl;
  }
}
