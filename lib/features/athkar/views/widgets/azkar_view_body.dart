import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/athkar/views/widgets/azkar_app_bar.dart';
import 'package:al_muslim/features/athkar/views/widgets/azkar_title_card.dart';
import 'package:flutter/material.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AzkarAppBar(
            azkarType: 'الاذكار',
            azkarAbout: ' اذكار لمختلف المواقف والاحداث فى \nالحياه اليوميه,'),
        Expanded(
          child: FutureBuilder(
              future: AzkarServices().getAllCategory(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  AzkarTitleCard(categorytTitle: snapShot.data![index], pageid: index,);
                    },
                  );
                } else {
                  return const Text('data');
                }
              }),
        ),
      ],
    );
  }
}
