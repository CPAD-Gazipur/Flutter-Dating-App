import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color beginColor;
  final Color endColor;
  final Color textColor;
  final Function()? onPressed;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.beginColor,
    required this.endColor,
    required this.textColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColorLight.withAlpha(50),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(2, 2),
          )
        ],
        gradient: LinearGradient(
          colors: [
            beginColor,
            endColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          fixedSize: const Size(200, 40),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
