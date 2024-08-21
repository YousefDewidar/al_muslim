import 'package:al_muslim/features/home/presentation/views/widgets/features_grid_view.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/quran_card.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/routine_track_card.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/random_card.dart';
import 'package:flutter/material.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          QuranCard(),
          FeaturesGridView(),
          RoutineTrackCard(),
          RandomCard(),
          
        ],
      ),
    );
  }
}
