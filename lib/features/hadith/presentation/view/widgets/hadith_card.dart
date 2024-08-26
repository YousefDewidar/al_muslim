import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HadithCard extends StatelessWidget {
  final HadithModel hadith;
  const HadithCard({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, bottom: 20, left: 20, right: 20),
        child: Column(
          children: [
            BlocBuilder<FavCubit, FavState>(
              builder: (context, state) {
                return CirculeActionButton(
                  color: Colors.red,
                  icon: hadith.isFav ? Icons.favorite : Icons.favorite_border,
                  radius: 20,
                  onTap: () {
            
                  },
                );
              },
            ),
            Text(
              hadith.hadith,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.labelLarge!.copyWith(height: 1.8),
            ),
          ],
        ),
      ),
    );
  }
}
