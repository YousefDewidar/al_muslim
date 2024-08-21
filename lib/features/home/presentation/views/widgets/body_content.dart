import 'package:flutter/material.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 250),
      height: MediaQuery.of(context).size.height * .68,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
    );
  }
}