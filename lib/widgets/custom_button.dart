import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
    this.emailController,
    this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
        ),
        onPressed: () async {
          if (emailController != null && passwordController != null) {
            await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                  email: emailController!.text,
                  password: passwordController!.text,
                )
                .then((value) => debugPrint('Account Created Successfully'))
                .catchError((error) => debugPrint('Error: $error'));
          }

          tabController.animateTo(tabController.index + 1);
        },
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
