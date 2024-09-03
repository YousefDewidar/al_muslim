import 'package:flutter/material.dart';

class PlayCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isPlay;
  final void Function()? onPressed;

  const PlayCard({
    this.width = 75,
    this.height = 75,
    this.onPressed,
    super.key,
    required this.isPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.withOpacity(0.2), Colors.pink.withOpacity(0.2)],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink, Colors.blue],
          ),
        ),
        child: RawMaterialButton(
            onPressed: onPressed,
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: Icon(
              isPlay ? Icons.pause : Icons.play_arrow,
              size: 35,
              color: Colors.white,
            )),
      ),
    );
  }
}
