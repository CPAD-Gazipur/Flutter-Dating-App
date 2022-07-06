import 'package:flutter/material.dart';
import 'package:flutter_dating_app/widgets/widgets.dart';

import 'onboarding_tab_screens/screens.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const String routeName = '/on-boarding';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const OnBoardingScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(
      text: 'Start',
    ),
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
                ],
              ),
            );
          },
        ));
  }
}
