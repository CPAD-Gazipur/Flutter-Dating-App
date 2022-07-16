import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dating_app/config/config.dart';
import 'package:flutter_dating_app/repositories/auth/auth_repository.dart';
import 'package:flutter_dating_app/screens/screens.dart';

import 'blocs/blocs.dart';
import 'models/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (_) => SwipeBloc()
              ..add(
                LoadUsersEvent(users: User.users),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Dating App',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoute.onGenerateRoute,
          initialRoute: OnBoardingScreen.routeName,
        ),
      ),
    );
  }
}
