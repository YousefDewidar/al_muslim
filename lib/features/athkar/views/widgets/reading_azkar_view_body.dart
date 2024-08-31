// import 'package:al_muslim/features/athkar/data/azkar_model.dart';
// import 'package:al_muslim/features/athkar/data/azkar_services.dart';
// import 'package:al_muslim/core/widgets/custom_app_bar.dart';
// import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
// import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_state.dart';
// import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/athkar/views/widgets/zekr_card.dart';
import 'package:flutter/material.dart';

class ReadingAzkarViewBody extends StatelessWidget {
  final int startIndex;
  const ReadingAzkarViewBody({
    super.key,
    required this.startIndex,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AzkarModel>>(
        future: AzkarServices().getAzkar(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<AzkarModel> azkar = snapShot.data!;
            return Column(
              children: [
                CustomAppBar(
                  header: azkar[startIndex].category,
                  desc: 'تعزز السكينه والطمانينه ف القلب ',
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: azkar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ZekrCard(azkar: azkar[startIndex],isFavvvv:azkar[startIndex].isFav);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Text('');
          }
        });}}