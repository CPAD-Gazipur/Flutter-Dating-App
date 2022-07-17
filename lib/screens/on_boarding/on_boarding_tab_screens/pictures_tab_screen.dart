import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/images/images_bloc.dart';
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
                BlocBuilder<ImagesBloc, ImagesState>(
                  builder: (context, state) {
                    if (state is ImagesLoading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (state is ImagesLoaded) {
                      var imageCount = state.imageUrls.length;

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              (imageCount > 0)
                                  ? CustomImageContainer(
                                      imageUrl: state.imageUrls[0])
                                  : const CustomImageContainer(),
                              (imageCount > 1)
                                  ? CustomImageContainer(
                                      imageUrl: state.imageUrls[1])
                                  : const CustomImageContainer(),
                              (imageCount > 2)
                                  ? CustomImageContainer(
                                      imageUrl: state.imageUrls[2])
                                  : const CustomImageContainer(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              (imageCount > 3)
                                  ? CustomImageContainer(
                                      imageUrl: state.imageUrls[3])
                                  : const CustomImageContainer(),
                              (imageCount > 4)
                                  ? CustomImageContainer(
                                      imageUrl: state.imageUrls[4])
                                  : const CustomImageContainer(),
                              (imageCount > 5)
                                  ? CustomImageContainer(
                                      imageUrl: state.imageUrls[5])
                                  : const CustomImageContainer(),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('Something went wrong...'),
                      );
                    }
                  },
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
