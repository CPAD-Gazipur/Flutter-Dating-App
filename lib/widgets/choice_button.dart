import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  final Color color;
  final bool hasGradiant;
  final IconData icon;
  const ChoiceButton({
    Key? key,
    this.height = 60,
    this.width = 60,
    this.size = 25,
    required this.color,
    this.hasGradiant = false,
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
