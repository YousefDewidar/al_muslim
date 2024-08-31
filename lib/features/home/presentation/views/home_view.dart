import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRefreshIndicator(
        durations: const RefreshIndicatorDurations(
          finalizeDuration: Duration(seconds: 1),
        ),
        onRefresh: () async {
          bool isConnected = await InternetConnectionChecker().hasConnection;
          if (isConnected) {
            SalahServices().setDayData();
            PrayTimeServices().getPrayTime();
            AzkarServices().setAzkarAsString();
          } else {
            // ignore: use_build_context_synchronously
            InsideNotification.networkCheck(context);
          }
        },
        builder: (BuildContext context, Widget child,
            IndicatorController controller) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Transform.translate(
                offset: Offset(0, controller.value),
                child: child,
              ),
              Positioned(
                top: 100.0 * controller.value - 20,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    value: controller.isDragging || controller.isArmed
                        ? null
                        : math.min(controller.value, 1.0),
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          );
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            HomeViewBody(),
          ],
        ),
      ),
    );
  }
}
