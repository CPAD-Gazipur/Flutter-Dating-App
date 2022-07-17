import '../../models/models.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser();

  Future<void> updateUserPictures(String imageName);
}
