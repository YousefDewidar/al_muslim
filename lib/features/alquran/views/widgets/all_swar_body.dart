import 'dart:developer';

import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:al_muslim/core/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';

class AllSwarViewBody extends StatefulWidget {
  final String pageRoute;
  final String? swrahUrl;
  final String reacterName;
  const AllSwarViewBody(
      {super.key,
      required this.pageRoute,
      this.swrahUrl,
      required this.reacterName});

  @override
  State<AllSwarViewBody> createState() => _AllSwarViewBodyState();
}

class _AllSwarViewBodyState extends State<AllSwarViewBody> {
  List<SwarModel> searchedList = [];
  late List<SwarModel> allSwar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(header: 'السور', desc: ''),

        // Search
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: TextField(
            onChanged: (searcherChar) {
              searchedList = allSwar
                  .where(
                      (sura) => sura.name.toLowerCase().contains(searcherChar))
                  .toList();
              log(searchedList[0].id.toString());
              setState(() {});
            },
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintTextDirection: TextDirection.rtl,
              hintText: 'ابحث عن السورة التي تريدها',
              hintStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 16),
              suffixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),

        // Suar list view
        Expanded(
          child: FutureBuilder(
              future: FehresService().getFromDataBase(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  allSwar = snapShot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: searchedList.isEmpty
                        ? allSwar.length
                        : searchedList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return searchedList.isEmpty
                          ? CustomTitleCard(
                              suraName: allSwar[index].name,
                              swrahUrl: manageIndex(index),
                              categorytTitle: allSwar[index].name,
                              pageName: widget.pageRoute,
                              pagestartIndex: index + 1,
                              reacterName: widget.reacterName,
                            )
                          : CustomTitleCard(
                              suraName:
                                  allSwar[searchedList[index].id - 1].name,
                              swrahUrl: manageIndex(searchedList[index].id - 1),
                              categorytTitle: searchedList[index].name,
                              pageName: widget.pageRoute,
                              pagestartIndex: (searchedList[index].id - 1) + 1,
                              reacterName: widget.reacterName,
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
      return '${widget.swrahUrl}${'00${index + 1}.mp3'}';
    } else if (index + 1 >= 10 && index + 1 < 100) {
      return '${widget.swrahUrl}${'0${index + 1}.mp3'}';
    } else {
      return '${widget.swrahUrl}${'${index + 1}.mp3'}';
    }
  }
}
