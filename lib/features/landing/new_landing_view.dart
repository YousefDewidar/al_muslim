import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/widgets/landing_list_tile.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewLandingView extends StatefulWidget {
  const NewLandingView({super.key});

  @override
  State<NewLandingView> createState() => _NewLandingViewState();
}

class _NewLandingViewState extends State<NewLandingView> {
  bool hasPermission = false;
  bool hasLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/landing_masged.png'),
          LandingListTile(
            buttonChild:
                hasLocation ? const Text('تم التفعيل ') : const Text('تفعيل'),
            title: 'يجب تفعيل الموقع للاستمرار ف تسجيل الدخول',
            onPressed: () async{
              await Location().openLocationSettings();
              hasLocation = Location.isEnabel;
              setState(() {});
              //Load Data
              PrayTimeServices().getPrayTime();
              SalahServices().setDayData();
            },
          ),
          LandingListTile(
            title: 'يجب اعطاء صلاحيه الموقع  للاستمرار ',
            onPressed: ()async {
              if (hasLocation == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('يجب تفعيل الموقع اولا'),
                  ),
                );
              }
              await Location().getPermision();
              hasPermission = Location.hasPermision;
              setState(() {});
              //load Data
              AzkarServices().getAllCategory();
              AzkarServices().getAllAzkarInfo(0);
              FehresService().getAllSwar();
            },
            buttonChild:
                hasPermission ? const Text('تم التفعيل ') : const Text('تفعيل'),
          ),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('hasSeenLandingPage', true);
              if (hasPermission == true && hasLocation == true) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
              }
            },
            child: const Text('دخول'),
          )
        ],
      ),
    );
  }
}
