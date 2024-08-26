import 'package:flutter/material.dart';

class CirculeActionButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double radius;
  final Function()? onTap;
  final Function()? onPressed;
  const CirculeActionButton({
    super.key,
    required this.color,
    required this.icon,
    required this.radius,
    this.onTap,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
          backgroundColor: color,
          radius: radius,
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            onPressed: onPressed,
          )),
    );
  }
}
