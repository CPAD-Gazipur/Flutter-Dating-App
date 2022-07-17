import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dating_app/models/user_model.dart';
import 'package:flutter_dating_app/repositories/repositories.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return firebaseFirestore
        .collection('users')
        .doc('xSpAcqpLrgbqKYycykrJ')
        .snapshots()
        .map((snapshot) => User.fromSnapshot(snapshot));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadImageUrl =
        await StorageRepository().getDownloadUrl(imageName);

    return firebaseFirestore
        .collection('users')
        .doc('xSpAcqpLrgbqKYycykrJ')
        .update({
      'imageUrls': FieldValue.arrayUnion([downloadImageUrl]),
    });
  }
}
