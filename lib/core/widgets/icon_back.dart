import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  const IconBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
