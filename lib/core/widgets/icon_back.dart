import 'package:flutter/material.dart';

class IconBackk extends StatelessWidget {
  const IconBackk({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 37,
        width: 37,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).textTheme.bodyLarge!.color!),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ),
    );
  }
}
