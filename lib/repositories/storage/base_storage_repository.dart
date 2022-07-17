import 'package:image_picker/image_picker.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(XFile image);

  Future<String> getDownloadUrl(String imageName);
}
