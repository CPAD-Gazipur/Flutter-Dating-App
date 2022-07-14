import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class EmailVerificationTabScreen extends StatelessWidget {
  final TabController tabController;

  const EmailVerificationTabScreen({
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
                  text: 'Did You Get The Verification Code?',
                ),
                CustomTextField(
                  tabController: tabController,
                  hintText: 'ENTER YOUR CODE',
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
