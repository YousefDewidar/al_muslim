import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';


class CustomTitleCard extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final void Function() onTap;

  const CustomTitleCard({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            Icon(
              suffixIcon ?? Icons.arrow_back_ios,
              color: Theme.of(context).textTheme.labelLarge!.color,
            ),
            const Spacer(),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .65),
              child: Text(
                title,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelLarge!,
              ),
            ),
            const SpaceH(10),
            Icon(prefixIcon,
                color: Theme.of(context).textTheme.labelLarge!.color),
          ],
        ),
      ),
    );
  }
}
