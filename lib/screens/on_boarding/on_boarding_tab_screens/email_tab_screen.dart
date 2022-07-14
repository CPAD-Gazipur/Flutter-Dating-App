import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class EmailTabScreen extends StatelessWidget {
  final TabController tabController;
  const EmailTabScreen({
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextHeader(
                  tabController: tabController,
                  text: 'What\'s Your Email Address?',
                ),
                CustomTextField(
                  tabController: tabController,
                  hintText: 'ENTER YOUR EMAIL',
                ),
              ],
            ),
            CustomButton(
              tabController: tabController,
              text: 'NEXT STEP',
            ),
          ],
        ));
  }
}
