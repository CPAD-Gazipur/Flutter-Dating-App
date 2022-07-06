import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  static const String routeName = '/user';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const UserScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserScreen'),
      ),
    );
  }
}
