import 'package:flutter/material.dart';

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
          children: [
            SizedBox(height: 50),
            Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/dating_splash.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome To Dating App',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 20),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    height: 1.8,
                  ),
              textAlign: TextAlign.justify,
            )
          ],
        ));
  }
}
