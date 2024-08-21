import 'package:al_muslim/features/home/presentation/view/widgets/features_grid_view.dart';
import 'package:al_muslim/features/home/presentation/view/widgets/quran_card.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuranCard(),
        FeaturesGridView(),
      ],
    );
  }
}
