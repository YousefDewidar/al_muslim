import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.amber,
        onRefresh: () async {
          bool isConnected = await InternetConnectionChecker().hasConnection;
          if (isConnected) {
            SalahServices().setDayData();
            PrayTimeServices().getPrayTime();
            String location = await FinalLoc.getLoc();
            InsideNotification.insideNotificationCard(
                content: '$location الموقع الحالي هو ',
                contentType: ContentType.success,
                context: context,
                title: 'تم تحديث البيانات بنجاح');
          } else {
            InsideNotification.networkCheck(context);
          }
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
