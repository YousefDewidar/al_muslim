import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/data/services.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/salah_column.dart';
import 'package:flutter/material.dart';

class AzanList extends StatefulWidget {
  const AzanList({
    super.key,
  });
  @override
  State<AzanList> createState() => _AzanListState();
}

class _AzanListState extends State<AzanList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .1,
          width: MediaQuery.of(context).size.width * 1,
          child: FutureBuilder<AzanModel>(
            future: AzanServices().getAzanTime(),
            builder: (context, snapShot) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  AzanModel prayTime = snapShot.data!;

                  final List<AzanModel> azan = [
                    AzanModel(
                      title: 'الفجر',
                      icon: Icons.cloud,
                      prayTime: prayTime.timings.fajr,
                      timings: prayTime.timings,
                    ),
                    AzanModel(
                        title: 'الظهر',
                        icon: Icons.wb_sunny_outlined,
                        timings: prayTime.timings,
                        prayTime: prayTime.timings.dhuhr),
                    AzanModel(
                        title: 'العصر',
                        icon: Icons.sunny,
                        timings: prayTime.timings,
                        prayTime: prayTime.timings.asr),
                    AzanModel(
                        title: 'المغرب',
                        icon: Icons.nights_stay_outlined,
                        timings: prayTime.timings,
                        prayTime: prayTime.timings.maghrib),
                    AzanModel(
                        title: 'العشاء',
                        icon: Icons.nightlight_outlined,
                        timings: prayTime.timings,
                        prayTime: prayTime.timings.isha),
                  ];
                  if (snapShot.hasData) {
                    return SalahColumn(
                      azan: azan[index],
                    );
                  } else if (snapShot.hasError) {
                    Text(snapShot.data.toString());
                  }
                  return null;
                },
              );
            },
          ),
        ));
  }
}
