import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;

  const CustomButton({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFD84482),
            Color(0xFFF77F46),
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
        onPressed: () {},
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              'START',
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
