import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../blocs/blocs.dart';

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
      child: (imageUrl == null)
          ? Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                  top: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                  left: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                  right: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                ),
              ),
              child: Align(
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
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No image selected'),
                        ),
                      );
                    }

                    if (image != null) {
                      // ignore: use_build_context_synchronously
                      context
                          .read<OnBoardingBloc>()
                          .add(UpdateUserImages(image: image));
                      debugPrint('User image uploading...');
                    }
                  },
                ),
              ))
          : Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                  top: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                  left: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                  right: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  )
                ],
                image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
