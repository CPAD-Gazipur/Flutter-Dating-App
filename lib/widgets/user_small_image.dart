import 'package:flutter/material.dart';

class UserSmallImage extends StatelessWidget {
  final String userImage;
  final double height;
  final double width;

  const UserSmallImage({
    Key? key,
    required this.userImage,
    this.height = 60,
    this.width = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
