import 'package:al_muslim/features/favorites/presentation/view/widgets/fav_view_body.dart';
import 'package:flutter/material.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: FavViewBody(),
        );
  }
}
