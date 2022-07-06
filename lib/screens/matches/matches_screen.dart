import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  static const String routeName = '/matches';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const MatchesScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MatchesScreen'),
      ),
    );
  }
}
