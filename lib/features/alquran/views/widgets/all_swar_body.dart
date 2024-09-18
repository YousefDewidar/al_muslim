import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:al_muslim/core/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';

class AllSwarViewBody extends StatelessWidget {
  final String pageRoute;
  final String? swrahUrl;
  final String reacterName;
  const AllSwarViewBody(
      {super.key,
      required this.pageRoute,
      this.swrahUrl,
      required this.reacterName});

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
                    padding: EdgeInsets.zero,
                    itemCount: allSwar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomTitleCard(
                        suraName: allSwar[index].name,
                        swrahUrl: manageIndex(index),
                        categorytTitle: allSwar[index].name,
                        pageName: pageRoute,
                        pagestartIndex: index + 1,
                        reacterName: reacterName,
                      );
                    },
                  );
                } else {
                  return Center(child: Text(snapShot.error.toString()));
                }
              }),
        )
      ],
    );
  }

  String manageIndex(index) {
    if (index + 1 <= 9) {
      return '$swrahUrl${'00${index + 1}.mp3'}';
    } else if (index + 1 >= 10 && index + 1 < 100) {
      return '$swrahUrl${'0${index + 1}.mp3'}';
    } else {
      return '$swrahUrl${'${index + 1}.mp3'}';
    }
  }
}
