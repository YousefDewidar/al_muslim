import 'dart:developer';

import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';
import 'package:al_muslim/features/hadith/presentation/view%20model/hadith_services.dart';
import 'package:al_muslim/features/hadith/presentation/view/widgets/hadith_card.dart';
import 'package:flutter/material.dart';

class ReadingHadithViewBody extends StatelessWidget {
  const ReadingHadithViewBody(
      {super.key, required this.sahehName, required this.title});
  final String sahehName;
  final String title;

  @override
  Widget build(BuildContext context) {
    num hadithListCount = 0;
    return Column(
      children: [
        CustomAppBar(
            header: title, desc: 'عدد الأحاديث : $hadithListCount'),
        Expanded(
          child: FutureBuilder<List<HadithModel>>(
              future:
                  HadithServices().getHadithData(sahehName: sahehName),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  List<HadithModel> hadith = snapShot.data!;
                  hadithListCount = hadith.length;
                  log(hadithListCount.toString());
                  return ListView.builder(
                    itemCount: hadith.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HadithCard(hadith: hadith[index]);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  );
                }
              }),
        ),
      ],
    );
  }
}
