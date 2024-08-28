import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/alquran/data/model/fehres_model.dart';
import 'package:al_muslim/features/athkar/views/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ListenToAllSwarViewBody extends StatefulWidget {
  const ListenToAllSwarViewBody({super.key});

  @override
  State<ListenToAllSwarViewBody> createState() =>
      _ListenToAllSwarViewBodyState();
}

class _ListenToAllSwarViewBodyState extends State<ListenToAllSwarViewBody> {
  bool isPlayed = false;
  late int surahNum;
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

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
                        categorytTitle: allSwar[index].name,
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
}
