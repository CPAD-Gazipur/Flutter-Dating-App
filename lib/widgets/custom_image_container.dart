import 'package:flutter/material.dart';
import 'package:flutter_dating_app/repositories/repositories.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imageUrl;
  const CustomImageContainer({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
        right: 10.0,
      ),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border(
            bottom: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            top: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            left: BorderSide(color: Theme.of(context).primaryColor, width: 1),
            right: BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
        ),
        child: (imageUrl == null)
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No image selected'),
                        ),
                      );
                    }

                    if (image != null) {
                      StorageRepository().uploadImage(image);
                      debugPrint('Uploading...');
                    }
                  },
                ),
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
