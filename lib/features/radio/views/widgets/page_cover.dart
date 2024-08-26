import 'package:flutter/material.dart';

class PageCover extends StatelessWidget {
  const PageCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/radio_image.png',
          ),
        ),
      ),
    );
  }
}