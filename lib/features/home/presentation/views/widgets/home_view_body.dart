import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/azan_list.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/body_content.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/home_bg_image.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/time_of_now.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AzanModel> azan = [
      AzanModel(title: 'الفجر', icon: Icons.abc, time: '04:40'),
      AzanModel(title: 'الظهر', icon: Icons.abc, time: '01:00'),
      AzanModel(title: 'العصر', icon: Icons.abc, time: '04:40'),
      AzanModel(title: 'المغرب', icon: Icons.abc, time: '08:30'),
      AzanModel(title: 'العشاء', icon: Icons.abc, time: '09:00'),
    ];
    String time = DateFormat('hh:mm').format(DateTime.now());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Stack(
              children: [
                const HomeBgImage(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    children: [
                      TimeofNow(time: time),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'اذان العشاء بعد 1:50:10',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      AzanList(azan: azan),
                    ],
                  ),
                ),
              ],
            ),
            const BodyContent(),
          ],
        ),
      
      ],
    );
  }
}
