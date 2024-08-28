import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final Icon icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(iconTheme: const IconThemeData(color: Colors.white)),
      child: IconButton(
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
