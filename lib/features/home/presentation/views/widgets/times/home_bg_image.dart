import 'package:al_muslim/core/helper/lang_converter.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/azan_list.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter/material.dart';

class HomeBgImage extends StatelessWidget {
  const HomeBgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * .39,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpaceV(5),
          // SizedBox(
          //   height: 100,
          //   width: 100,
          //   child: ClockView(),
          // ),
          Text(
            '12:00',
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
          ),

          SpaceV(5),
          HijriDate(),
          SpaceV(10),
          AzanList(),
        ],
      ),
    );
  }
}

class HijriDate extends StatelessWidget {
  const HijriDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SalahServices().getDayData(),
        builder: (context, snapShot) {
          return handelDate(snapShot, context);
        });
  }

  Widget handelDate(AsyncSnapshot<DayData> snapShot, BuildContext context) {
    if (snapShot.hasData) {
      DayData date = snapShot.data!;
      String month = date.date.monthHName;
      String dayInAr =
          LangConverter().convertToArabic(int.parse(date.date.dayHnum));
      String yearInAr =
          LangConverter().convertToArabic(int.parse(date.date.hijriYear));
      return Text(
        '$dayInAr $month $yearInAr',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
      );
    } else if (snapShot.hasError) {
      return const Text('التاريخ غير متوفر ');
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
