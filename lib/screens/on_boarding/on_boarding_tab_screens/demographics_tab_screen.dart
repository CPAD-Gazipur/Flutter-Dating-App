import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../widgets/widgets.dart';

class DemographicsTabScreen extends StatelessWidget {
  final TabController tabController;
  const DemographicsTabScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
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
                  controller: controller,
                  hintText: 'ENTER YOUR AGE',
                )
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 3,
                  selectedColor: Theme.of(context).primaryColor,
                  unselectedColor: Theme.of(context).backgroundColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  tabController: tabController,
                  text: 'NEXT STEP',
                ),
              ],
            ),
          ],
        ));
  }
}
