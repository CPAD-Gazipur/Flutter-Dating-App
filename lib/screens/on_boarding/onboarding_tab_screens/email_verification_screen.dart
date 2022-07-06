import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  final TabController tabController;
  const EmailVerificationScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Container(),
    );
  }
}
