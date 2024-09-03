import 'package:flutter/material.dart';

class PageCover extends StatelessWidget {
  final String? image;

  const PageCover({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image ??
                'assets/images/—Pngtree—beautiful al quran kareem islamic_6848467.png',
          ),
        ),
      ),
    );
  }
}
