import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/blocs.dart';
import 'package:flutter_dating_app/models/models.dart';

import '../cubits/cubits.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;

  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
        ),
        onPressed: () async {
          if (tabController.index == 6) {
            Navigator.pushNamed(context, '/');
          } else {
            tabController.animateTo(tabController.index + 1);
          }
          if (tabController.index == 2) {
            await context.read<SignupCubit>().signupWithCredentials();

            User user = User(
              // ignore: use_build_context_synchronously
              id: context.read<SignupCubit>().state.user!.uid,
              name: '',
              age: 0,
              gender: '',
              imageUrls: const [],
              interests: const [],
              bio: '',
              jobTitle: '',
              location: '',
            );

            // ignore: use_build_context_synchronously
            context
                .read<OnBoardingBloc>()
                .add(StartOnBoardingEvent(user: user));
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
