import 'package:flutter/material.dart';

class UserSmallImage extends StatelessWidget {
  final String userImage;
  const UserSmallImage({
    Key? key,
    required this.userImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(
        top: 8,
        right: 8,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(userImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
