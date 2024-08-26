import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:al_muslim/features/athkar/views/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';

class AllSwarViewBody extends StatelessWidget {
  const AllSwarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [const CustomAppBar(header: 'السور', desc: ''),
        Expanded(
          child: FutureBuilder(
              future: FehresService().getFromDataBase(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  List<SwarModel> allSwar = snapShot.data!;
                  return ListView.builder(
                    itemCount: allSwar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  CustomTitleCard(categorytTitle: allSwar[index].name, pageName: 'redingTafser',);
                    },
                  );
                } else {
                  return  Center(child: Text(snapShot.data.toString()));
                }
              }),
        )
  ],
    );
  }
}