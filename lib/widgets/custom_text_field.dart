import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TabController tabController;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.tabController,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(
          bottom: 5.0,
          top: 12.5,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
