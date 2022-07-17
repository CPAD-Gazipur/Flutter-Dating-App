import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:flutter_dating_app/repositories/repositories.dart';
import 'package:flutter_dating_app/widgets/widgets.dart';

import '../../cubits/cubits.dart';
import 'on_boarding_tab_screens/screens.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const String routeName = '/on-boarding';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => OnBoardingBloc(
              databaseRepository: DatabaseRepository(),
              storageRepository: StorageRepository(),
            )..add(
                StartOnBoardingEvent(),
              ),
          ),
        ],
        child: const OnBoardingScreen(),
      ),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification'),
    Tab(text: 'Demographics'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
    Tab(text: 'Location'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Builder(
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context)!;
            tabController.addListener(() {
              if (tabController.indexIsChanging) {}
            });
            return Scaffold(
              appBar: const CustomAppBar(
                title: 'DATING',
                hasAction: false,
              ),
              body: TabBarView(
                children: [
                  StartTabScreen(tabController: tabController),
                  EmailTabScreen(tabController: tabController),
                  EmailVerificationTabScreen(tabController: tabController),
                  DemographicsTabScreen(tabController: tabController),
                  PicturesTabScreen(tabController: tabController),
                  BiographyTabScreen(tabController: tabController),
                  LocationTabScreen(tabController: tabController),
                ],
              ),
            );
          },
        ));
  }
}
