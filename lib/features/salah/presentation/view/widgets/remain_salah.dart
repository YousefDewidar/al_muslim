import 'dart:async';

import 'package:al_muslim/core/helper/time_helper.dart';
import 'package:al_muslim/core/utils/constants.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';

class RemainSalah extends StatefulWidget {
  const RemainSalah({
    super.key,
  });

  @override
  State<RemainSalah> createState() => _RemainSalahState();
}

class _RemainSalahState extends State<RemainSalah> {
  Timer? timer;

  void updateSeconds() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {},
      ),
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
    return FutureBuilder(
      future: TimeHelper().getRemaindSalahinfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(
                'صلاة ${snapshot.data!.entries.first.key} بعد',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Constants.kBgColDark),
              ),
              Text(
                snapshot.data!.entries.first.value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 2,
                    color: Constants.kBgColDark,
                    fontFamily: AutofillHints.creditCardExpirationDate),
              ),
            ],
          );
        } else {
          return const SpaceH(0);
        }
      },
    );
  }
}
