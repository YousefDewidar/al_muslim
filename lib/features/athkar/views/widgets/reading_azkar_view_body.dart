import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/athkar/views/widgets/zekr_card.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingAzkarViewBody extends StatelessWidget {
  const ReadingAzkarViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return FutureBuilder<List<AzkarModel>>(
            future: AzkarServices().getAzkar(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                List<AzkarModel> azkar = snapShot.data!;
                return Column(
                  children: [
                    CustomAppBar(
                      header: azkar[0].category,
                      desc: 'تعزز السكينه والطمانينه ف القلب ',
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: azkar.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ZekrCard(
                            azkar: azkar[index],
                            isFavvvv: BlocProvider.of<FavCubit>(context)
                                .isFound(azkar[index]),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Text('');
              }
            });
      },
    );
  }
}
