import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/blocs.dart';
import 'package:flutter_dating_app/screens/screens.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/blocs.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          debugPrint('${state.status}');
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              const Duration(seconds: 1),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                OnBoardingScreen.routeName,
                ModalRoute.withName('/onBoarding'),
              ),
            );
          } else if (state.status == AuthStatus.authenticated) {
            Timer(
              const Duration(seconds: 1),
              () => Navigator.of(context).pushNamed(HomeScreen.routeName),
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/dating_splash.png'),
                ),
                const SizedBox(height: 20),
                Text(
                  'Flutter Dating App',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
