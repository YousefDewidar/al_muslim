import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/notification/noti_service.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/widgets/landing_list_tile.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewLandingView extends StatefulWidget {
  const NewLandingView({super.key});

  @override
  State<NewLandingView> createState() => _NewLandingViewState();
}

class _NewLandingViewState extends State<NewLandingView> {
  bool hasPermission = false;
  bool hasLocation = false;
  bool downloading = false;

  void mm() async {
    hasLocation = await Geolocator.isLocationServiceEnabled();
    setState(() {});
    Permission.location.request().then((val) {
      hasPermission = (val == PermissionStatus.granted);
    });
  }

  @override
  Widget build(BuildContext context) {
    mm();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo/brand.png',
            height: 60,
            width: 220,
            color: Colors.orange,
          ),
          const SpaceV(40),
          Image.asset('assets/images/landing_masged.png', height: 360),
          const SpaceV(20),
          LandingListTile(
            buttonChild:
                hasLocation ? const Text('تم التفعيل ') : const Text('تفعيل'),
            title: 'يجب تفعيل الموقع للاستمرار ف تسجيل الدخول',
            onPressed: () async {
              await Location().openLocationSettings();
              setState(() {});
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (hasLocation && hasPermission == true) {
                downloading = true;
                setState(() {});
                try {
                  await PrayTimeServices().getPrayTime();
                  await SalahServices().setDayData();
                  await AzkarServices().getAllCategory();
                  await AzkarServices().getAllAzkarInfo(0);
                  await FehresService().getAllSwar();
                  await NotificationService.createNotification();

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('hasSeenLandingPage', true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                } catch (e) {
                  downloading = false;
                }
              }
            },
            child: downloading
                ? const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('دخول'),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    downloading = false;
    super.dispose();
  }
}
