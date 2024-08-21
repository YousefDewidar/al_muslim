import 'package:al_muslim/features/home/presentation/views/widgets/body_content.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/home_bg_image.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeBgImage(),
        BodyContent(),
      ],
    );
  }
}
