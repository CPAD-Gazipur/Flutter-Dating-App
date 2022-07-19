import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/blocs/blocs.dart';
import 'package:flutter_dating_app/cubits/cubits.dart';
import 'package:flutter_dating_app/screens/screens.dart';
import 'package:flutter_dating_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider.of<AuthBloc>(context).state.status ==
              AuthStatus.authenticated
          ? const HomeScreen()
          : const LoginScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'DATING',
        hasAction: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EmailInput(),
            const SizedBox(height: 10),
            const PasswordInput(),
            const SizedBox(height: 40),
            CustomElevatedButton(
              text: 'LOGIN',
              beginColor: Colors.white,
              endColor: Colors.white,
              textColor: Theme.of(context).primaryColorLight,
              onPressed: () {
                context.read<LoginCubit>().logInWithCredentials();
              },
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: 'SIGNUP',
              beginColor: Theme.of(context).colorScheme.secondary,
              endColor: Theme.of(context).primaryColorLight,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/onBoarding');
              },
            )
          ],
        ),
      ),
    );
  }
}
