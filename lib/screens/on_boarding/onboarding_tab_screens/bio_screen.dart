import 'package:flutter/material.dart';

class BioScreen extends StatelessWidget {
  final TabController tabController;
  const BioScreen({
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
