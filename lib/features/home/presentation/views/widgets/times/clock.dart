import 'dart:async';
import 'dart:developer';
import 'package:al_muslim/core/helper/lang_converter.dart';
import 'package:al_muslim/core/helper/time_helper.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
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

  void updateSeconds() async {
    AzanModel azan = await PrayTimeServices().getDataFromDB();

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(
        () {//   (2 /4 =0.5) /// (1/4 =0.25)
          indicatorVal = (int.parse(azan.timings.asr.substring(0, 2)).toDouble() - DateTime.now().hour) /4;
          log(indicatorVal.toString());
          //int.parse(azan.timings.asr.substring(0, 2)).toDouble()- DateTime.now().hour
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
            final hour = LangConverter().convertToArabic(
                int.parse(snapshot.data!.entries.first.value.split(':')[0]));
            final min = LangConverter().convertToArabic(
                int.parse(snapshot.data!.entries.first.value.split(':')[1]));
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${snapshot.data!.entries.first.key} بعد',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 248, 248, 248),
                    height: 1.3,
                  ),
                ),
                Text(
                  '$hourس$minد',
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
