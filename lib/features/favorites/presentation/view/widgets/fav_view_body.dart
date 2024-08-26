import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:al_muslim/features/hadith/presentation/view/widgets/hadith_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
            header: 'المفضلة', desc: 'جميع الأحاديث والأذكار التي اعجبتك'),
        Expanded(
          child: BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: BlocProvider.of<FavCubit>(context).allFavList.length,
                itemBuilder: (BuildContext context, int index) {
                  return HadithCard(
                    hadith:
                        BlocProvider.of<FavCubit>(context).allFavList[index],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
