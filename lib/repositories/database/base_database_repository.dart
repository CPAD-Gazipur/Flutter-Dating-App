import '../../models/models.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser(String userID);

  Stream<List<User>> getUsers(String userID, String gender);

  Future<void> createUser(User user);

  Future<void> updateUser(User user);

  Future<void> updateUserPictures(User user, String imageName);
}
