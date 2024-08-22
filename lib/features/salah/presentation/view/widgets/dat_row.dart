import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:flutter/material.dart';

class DayRow extends StatelessWidget {
  const DayRow({
    super.key,
    required this.dayData,
  });
  final DayData dayData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('${dayData.date.dayHnum} ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20)),
            Text(dayData.date.monthHName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 23)),
          ],
        ),
        Column(
          children: [
            Text(dayData.date.dayName,
                style: Theme.of(context).textTheme.headlineMedium),
            const SpaceV(5),
            Card(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  dayData.date.date,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: AutofillHints.addressCityAndState),
                ),
              ),
            ),
          ],
        ),
        const SpaceH(40)
      ],
    );
  }
}
