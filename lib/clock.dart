import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  double indicatorVal = 0.0; // Start at 0
  Timer? timer;

  String time() {
    return '${DateTime.now().hour}'
        ':'
        '${DateTime.now().minute.toString().padLeft(2, '0')}'
        ':'
        '${DateTime.now().second.toString().padLeft(2, '0')}';
  }

  void updateSeconds() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(() {
        indicatorVal = DateTime.now().second / 60; // Update every second
      }),
    );
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
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 5.0,
            percent: indicatorVal,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: const Color.fromARGB(255, 250, 223, 161),
            backgroundColor: Colors.orange,
          ),
          Text(
            time(),
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 250, 223, 161),
            ),
          ),
        ],
      ),
    );
  }
}