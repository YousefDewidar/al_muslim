import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view/widgets/salah_item.dart';
import 'package:flutter/material.dart';

class SalahGridView extends StatelessWidget {
  const SalahGridView({
    super.key,
    required this.dayData,
  });
  final DayData dayData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .438,
      child: GridView.count(
        childAspectRatio: 2 / 1,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: [
          SalahItem(title: 'الشروق', time: dayData.salah.sunrise),
          SalahItem(title: 'الفجر', time: dayData.salah.fajr),
          SalahItem(title: 'العصر', time: dayData.salah.asr),
          SalahItem(title: 'الظهر', time: dayData.salah.dhuhr),
          SalahItem(title: 'العشاء', time: dayData.salah.isha),
          SalahItem(title: 'المغرب', time: dayData.salah.maghrib),
          SalahItem(title: 'الثلث الاخير', time: dayData.salah.lastthird),
          SalahItem(title: 'منتصف الليل', time: dayData.salah.midnight),
        ],
      ),
    );
  }
}
