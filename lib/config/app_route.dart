import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('This is Route: ${settings.name}');

    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case ChatScreen.routeName:
        return ChatScreen.route();
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case UserScreen.routeName:
        return UserScreen.route(user: settings.arguments as User);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error Page'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
