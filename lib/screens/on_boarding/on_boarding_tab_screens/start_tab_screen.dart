import 'package:flutter/material.dart';
import 'package:flutter_dating_app/widgets/widgets.dart';

class StartTabScreen extends StatelessWidget {
  final TabController tabController;
  const StartTabScreen({
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
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/dating_splash.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Welcome To Dating App',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        height: 1.8,
                      ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
              ],
            ),
            CustomButton(
              tabController: tabController,
              text: 'START',
            ),
          ],
        ));
  }
}
