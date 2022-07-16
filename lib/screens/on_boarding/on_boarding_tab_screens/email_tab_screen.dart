import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../cubits/cubits.dart';
import '../../../widgets/widgets.dart';

class EmailTabScreen extends StatelessWidget {
  final TabController tabController;
  const EmailTabScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
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
                const CustomTextHeader(text: 'What\'s Your Email Address?'),
                CustomTextField(
                  hintText: 'ENTER YOUR EMAIL',
                  onChanged: (value) {
                    context.read<SignupCubit>().emailChanged(value);
                    debugPrint(state.email);
                  },
                ),
                const SizedBox(height: 100),
                const CustomTextHeader(text: 'Choose a Password?'),
                CustomTextField(
                  hintText: 'ENTER YOUR PASSWORD',
                  onChanged: (value) {
                    context.read<SignupCubit>().passwordChanged(value);
                    debugPrint(state.password);
                  },
                ),
              ],
            ),
            Column(
              children: [
                StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 1,
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
        ),
      );
    });
  }
}
