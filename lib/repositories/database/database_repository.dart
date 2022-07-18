import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dating_app/models/user_model.dart';
import 'package:flutter_dating_app/repositories/repositories.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser(String userID) {
    return firebaseFirestore
        .collection('users')
        .doc(userID)
        .snapshots()
        .map((snapshot) => User.fromSnapshot(snapshot));
  }

  @override
  Future<void> updateUserPictures(User user, String imageName) async {
    String downloadImageUrl =
        await StorageRepository().getDownloadUrl(user, imageName);

    return firebaseFirestore.collection('users').doc(user.id).update({
      'imageUrls': FieldValue.arrayUnion([downloadImageUrl]),
    });
  }

  @override
  Future<void> createUser(User user) async {
    await firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  @override
  Future<void> updateUser(User user) {
    return firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => debugPrint('User data updated.'));
  }
}
