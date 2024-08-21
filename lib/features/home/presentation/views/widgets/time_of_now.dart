import 'package:flutter/material.dart';

class TimeofNow extends StatelessWidget {
  const TimeofNow({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: Theme.of(context)
          .textTheme
          .displayMedium!
          .copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}