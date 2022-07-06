import 'package:flutter/material.dart';
import 'package:flutter_dating_app/config/config.dart';
import 'package:flutter_dating_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dating App',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
