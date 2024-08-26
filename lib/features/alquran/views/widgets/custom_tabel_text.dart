import 'package:flutter/material.dart';

class CustomTabelText extends StatelessWidget {
  final String text;
  const CustomTabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontFamily: 'notoCofi',fontWeight: FontWeight.bold)),
    );
  }
}
