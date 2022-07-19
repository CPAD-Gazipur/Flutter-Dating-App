import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../blocs/blocs.dart';
import '../../../widgets/widgets.dart';

class DemographicsTabScreen extends StatelessWidget {
  final TabController tabController;
  const DemographicsTabScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        if (state is OnBoardingLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is OnBoardingLoaded) {
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
                        text: 'MALE',
                        value: state.user.gender == 'Male',
                        onChanged: (bool? newValue) {
                          context.read<OnBoardingBloc>().add(
                                UpdateUser(
                                  user: state.user.copyWith(gender: 'Male'),
                                ),
                              );
                        },
                      ),
                      CustomCheckBox(
                        text: 'FEMALE',
                        value: state.user.gender == 'Female',
                        onChanged: (bool? newValue) {
                          context.read<OnBoardingBloc>().add(
                                UpdateUser(
                                  user: state.user.copyWith(gender: 'Female'),
                                ),
                              );
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomTextHeader(
                        tabController: tabController,
                        text: 'What\'s Your Age?',
                      ),
                      CustomTextField(
                        hintText: 'ENTER YOUR AGE',
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            context.read<OnBoardingBloc>().add(
                                  UpdateUser(
                                    user: state.user
                                        .copyWith(age: int.parse(value)),
                                  ),
                                );
                          }
                        },
                        onChanged: (value) {
                          context.read<OnBoardingBloc>().add(
                                UpdateUser(
                                  user: state.user
                                      .copyWith(age: int.parse(value)),
                                ),
                              );
                        },
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
        } else {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }
      },
    );
  }
}
