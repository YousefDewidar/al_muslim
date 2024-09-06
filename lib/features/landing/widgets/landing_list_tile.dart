import 'package:flutter/material.dart';

class LandingListTile extends StatelessWidget {
  final String title;
  final Widget buttonChild;
  final Function() onPressed;
  const LandingListTile({
    super.key, required this.title, required this.onPressed, required this.buttonChild,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      leading: ElevatedButton(
        onPressed:onPressed,
        child: buttonChild,
      ),
    );
  }
}
