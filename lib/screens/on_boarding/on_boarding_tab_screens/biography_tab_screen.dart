import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../widgets/widgets.dart';

class BiographyTabScreen extends StatelessWidget {
  final TabController tabController;
  const BiographyTabScreen({
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
                        text: 'Describe Yourself a Bit ?',
                      ),
                      CustomTextField(
                        hintText: 'ENTER YOUR BIO',
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            context.read<OnBoardingBloc>().add(
                                  UpdateUser(
                                    user: state.user.copyWith(bio: value),
                                  ),
                                );
                          }
                        },
                        onChanged: (value) {
                          context.read<OnBoardingBloc>().add(
                                UpdateUser(
                                  user: state.user.copyWith(bio: value),
                                ),
                              );
                        },
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      CustomTextHeader(
                        tabController: tabController,
                        text: 'What Do You Like?',
                      ),
                      Row(
                        children: [
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'MUSIC',
                          ),
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'ECONOMICS',
                          ),
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'ART',
                          ),
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'POLITICS',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'NATURE',
                          ),
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'HIKING',
                          ),
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'FOOTBALL',
                          ),
                          CustomTextContainer(
                            tabController: tabController,
                            text: 'MOVIES',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      StepProgressIndicator(
                        totalSteps: 6,
                        currentStep: 5,
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
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
