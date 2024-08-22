
import 'package:flutter/material.dart';

class CirculeActionButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double radius;
  final Function()? onTap;
  const CirculeActionButton({
    super.key,
    required this.color,
    required this.icon,
    required this.radius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
          backgroundColor: color, radius: radius, child: Icon(icon,color: Colors.black,)),
    );
  }
}