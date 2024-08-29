import 'package:flutter/material.dart';

class PageCover extends StatelessWidget {
      final String? image; 

  const PageCover({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(10),
      height: 500,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            image ??'assets/images/ai_radio.jpg',
          ),
        ),
      ),
    );
  }
}