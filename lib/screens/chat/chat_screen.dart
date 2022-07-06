import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  static const String routeName = '/chat';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ChatScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatScreen'),
      ),
    );
  }
}
