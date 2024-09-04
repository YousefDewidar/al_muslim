import 'package:al_muslim/core/helper/time_helper.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/salah_column.dart';
import 'package:flutter/material.dart';

class AzanList extends StatelessWidget {
  const AzanList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TimeHelper().getRemaindSalahinfo(),
      builder: (context, salahNowSnap) => FutureBuilder<AzanModel>(
        future: PrayTimeServices().getDataFromDB(),
        builder: (context, snapShot) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return handleSalah(snapShot, index, salahNowSnap);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget? handleSalah(AsyncSnapshot<AzanModel> snapShot, int index,
      AsyncSnapshot<Map<String, String>> salahNowSnap) {
    if (snapShot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapShot.hasData) {
      return returnedSalahColumn(snapShot, index, salahNowSnap);
    } else {
      return Text(snapShot.error.toString());
    }
  }

  SalahColumn returnedSalahColumn(AsyncSnapshot<AzanModel> snapShot, int index,
      AsyncSnapshot<Map<String, String>> salahNowSnap) {
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
    return SalahColumn(
      azan: azan[index],
      iconCol: salahNowSnap.data!.entries.first.key == azan[index].title
          ? Colors.yellow
          : Colors.white,
    );
  }
}
