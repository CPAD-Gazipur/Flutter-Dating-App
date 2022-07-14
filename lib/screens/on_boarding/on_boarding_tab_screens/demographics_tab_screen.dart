import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class DemographicsTabScreen extends StatelessWidget {
  final TabController tabController;
  const DemographicsTabScreen({
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextHeader(
                  tabController: tabController,
                  text: 'What\'s Your Gender?',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCheckBox(
                  tabController: tabController,
                  text: 'MALE',
                ),
                CustomCheckBox(
                  tabController: tabController,
                  text: 'FEMALE',
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomTextHeader(
                  tabController: tabController,
                  text: 'What\'s Your Age?',
                ),
                CustomTextField(
                  tabController: tabController,
                  hintText: 'ENTER YOUR AGE',
                )
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
