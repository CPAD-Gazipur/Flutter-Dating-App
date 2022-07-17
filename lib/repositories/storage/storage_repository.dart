import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dating_app/repositories/repositories.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/models.dart';

class StorageRepository extends BaseStorageRepository {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Future<void> uploadImage(User user, XFile image) async {
    try {
      await firebaseStorage
          .ref('${user.id}/${image.name}')
          .putFile(File(image.path))
          .then(
            (p0) => DatabaseRepository().updateUserPictures(
              user,
              image.name,
            ),
          );
    } catch (_) {}
  }

  @override
  Future<String> getDownloadUrl(User user, String imageName) async {
    String downloadUrl =
        await firebaseStorage.ref('${user.id}/$imageName').getDownloadURL();

    return downloadUrl;
  }
}
