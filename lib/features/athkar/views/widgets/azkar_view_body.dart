import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/athkar/views/widgets/azkar_title_card.dart';
import 'package:flutter/material.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const AzkarAppBar(
          azkarType: 'الاذكار',
          azkarAbout: ' اذكار لمختلف المواقف والاحداث فى الحياه اليوميه,'),
      Expanded(
        child: FutureBuilder<List<AzkarModel>>(
            future: AzkarServices().getAzkar(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                List<AzkarModel> azkar = snapShot.data!;
                return ListView.builder(
                  itemCount: azkar.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AzkarTitleCard(
                      categorytTitle: azkar[index].category,
                    );
                  },
                );
              } else {
                return const Text('');
              }
            }),
      )
    ]);
  }
}
