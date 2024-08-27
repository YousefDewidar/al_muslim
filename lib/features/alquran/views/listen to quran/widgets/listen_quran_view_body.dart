import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/model/reacters_model.dart';
import 'package:al_muslim/features/alquran/data/reacters_services.dart';
import 'package:al_muslim/features/alquran/views/listen%20to%20quran/listen_to_all_swar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListenQuranViewBody extends StatelessWidget {
  const ListenQuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
            header: 'القراء', desc: "الاستماع الي مكتبه كبيره من القراء "),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
                future: ReactersServices().fetchReacters(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    List<ReactersModel> reacters = snapShot.data!;
                    return ListView.builder(
                      itemCount: reacters.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomReaderRow(
                          reacters: reacters,
                          index: index,
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        )
      ],
    );
  }
}

class CustomReaderRow extends StatelessWidget {
  final int index;
  const CustomReaderRow({
    super.key,
    required this.reacters,
    required this.index,
  });

  final List<ReactersModel> reacters;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ListenToAllSwarView());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(reacters[index].name,
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              const Icon(
                Icons.volume_down,
                size: 30,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
