import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/model/tafser_model.dart';
import 'package:al_muslim/features/alquran/data/tafser_services.dart';
import 'package:flutter/material.dart';

class TafserViewBody extends StatelessWidget {
  const TafserViewBody({super.key,});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(header: 'التفسير', desc: ''),
        Expanded(
          child: FutureBuilder(
              future:TafserServices().getFromDataBase(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  List<TafserModel> tafser = snapShot.data!;
                  return ListView.builder(
                    itemCount: tafser.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TafserCard(tafser: tafser[index]);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        )
      ],
    );
  }
}

class TafserCard extends StatelessWidget {
  final TafserModel tafser;
  const TafserCard({
    super.key,
    required this.tafser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Text(
            //arabic_text//aya
            '${tafser.ayanTitle}(${tafser.ayahNum})',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontFamily: 'IBMPlex'),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              tafser.ayahTafser,
              style: const TextStyle(fontFamily: 'IBMPlex'),
              textAlign: TextAlign.center,
              //translation
            ),
          )
        ],
      ),
    );
  }
}
