import 'dart:developer';

import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:al_muslim/features/athkar/views/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';

class AllSwarViewBody extends StatelessWidget {
  final String pageRoute;
  final String? swrahUrl;
  const AllSwarViewBody({super.key, required this.pageRoute, this.swrahUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(header: 'السور', desc: ''),
        Expanded(
          child: FutureBuilder(
              future: FehresService().getFromDataBase(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  List<SwarModel> allSwar = snapShot.data!;
                  return ListView.builder(
                    itemCount: allSwar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomTitleCard(
                        swrahUrl: manageIndex(index),
                        categorytTitle: allSwar[index].name,
                        pageName: pageRoute,
                        tafserstartIndex: index + 1,
                      );
                    },
                  );
                } else {
                  return Center(child: Text(snapShot.data.toString()));
                }
              }),
        )
      ],
    );
  }

  String manageIndex(index) {
    if (index + 1 <= 9) {
      log('less: $swrahUrl${'00${index + 1}.mp3'}');
      return '$swrahUrl${'00${index + 1}.mp3'}';
    } else if (index >= 10 && index < 100) {
      log('more:$swrahUrl${'0$index.mp3'}');
      return '$swrahUrl${'0$index.mp3'}';
    } else {
      log('more:$swrahUrl${'$index.mp3'}');
      return '$swrahUrl${'$index.mp3'}';
    }
  }
}
