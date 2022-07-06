import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          UserCard(user: User.users[0]),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceButton(
                  height: 60,
                  width: 60,
                  size: 25,
                  color: Theme.of(context).accentColor,
                  hasGradiant: false,
                  icon: Icons.clear_rounded,
                ),
                const ChoiceButton(
                  height: 80,
                  width: 80,
                  size: 35,
                  color: Colors.white,
                  hasGradiant: true,
                  icon: Icons.favorite,
                ),
                ChoiceButton(
                  height: 60,
                  width: 60,
                  size: 25,
                  color: Theme.of(context).primaryColor,
                  hasGradiant: false,
                  icon: Icons.watch_later_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  final Color color;
  final bool hasGradiant;
  final IconData icon;
  const ChoiceButton({
    Key? key,
    required this.height,
    required this.width,
    required this.size,
    required this.color,
    required this.hasGradiant,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradiant
            ? const LinearGradient(
                colors: [
                  Color(0xFFD84482),
                  Color(0xFFF77F46),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              )
            : const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
