import 'dart:async';
import 'package:al_muslim/core/helper/lang_converter.dart';
import 'package:al_muslim/core/helper/time_helper.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  double indicatorVal = 0.0;
  Timer? timer;

  void updateSeconds() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(
        () {
          indicatorVal = DateTime.now().second / (60);
        },
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    updateSeconds();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidCircularProgressIndicator(
      value: indicatorVal,
      valueColor:
          const AlwaysStoppedAnimation(Color.fromARGB(183, 17, 108, 154)),
      backgroundColor: Colors.transparent,
      borderColor: const Color.fromARGB(255, 254, 224, 115),
      borderWidth: .3,
      direction: Axis.vertical,
      center: FutureBuilder(
        future: TimeHelper().getRemaindSalahinfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String salahAfter = '';
            String hour = LangConverter()
                .convertToArabic(
                    int.parse(snapshot.data!.entries.first.value.split(':')[0]))
                .toString();
            String min = LangConverter()
                .convertToArabic(
                    int.parse(snapshot.data!.entries.first.value.split(':')[1]))
                .toString();
            if (hour == '') {
              hour = '';
            } else {
              hour = '$hourس';
            }
            if (min == '') {
              min = '';
            } else {
              min = '$minد';
            }
            if (hour == '' && min == '') {
              salahAfter = '${snapshot.data!.entries.first.key}\nحالا';
            } else {
              salahAfter = '${snapshot.data!.entries.first.key} بعد';
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  salahAfter,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 248, 248, 248),
                    height: 1.3,
                  ),
                ),
                Text(
                  '$hour$min',
                  style: const TextStyle(
                      fontSize: 26,
                      color: Color.fromARGB(255, 248, 248, 248),
                      height: 1),
                ),
              ],
            );
          } else {
            return const SpaceH(0);
          }
        },
      ),
    );
  }
}
