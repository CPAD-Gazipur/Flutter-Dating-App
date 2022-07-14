import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../widgets/widgets.dart';

class PicturesTabScreen extends StatelessWidget {
  final TabController tabController;
  const PicturesTabScreen({
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
                  text: 'Add 2 or More Pictures',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 4,
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
