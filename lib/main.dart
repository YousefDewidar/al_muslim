import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  runApp(const AlMuslim());
  AzkarServices().getAzkar();
  GetLocationData()
      .getLocation(position: await Location().getCurrentLocation())!;
}

class AlMuslim extends StatefulWidget {
  const AlMuslim({super.key});

  @override
  State<AlMuslim> createState() => _AlMuslimState();
}

class _AlMuslimState extends State<AlMuslim> {
  bool hasPermision=false;

  Future getPermision() async{
    if(await Permission.location.serviceStatus.isEnabled){
      var status=await Permission.location.status;
      if(status.isGranted){
        hasPermision=true;
      }else{
        Permission.location.request().then((val){
          hasPermision=(val==PermissionStatus.granted);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
      debugShowCheckedModeBanner: false,
      title: 'المسلم',
      themeMode: ThemeMode.light,
      darkTheme: CustomThemeData.darkData(context),
      theme: CustomThemeData.lightData(context),
      home:  FutureBuilder(
        future:getPermision() ,
        builder: (contex, snapshot) {
          if (hasPermision) {
            return const HomeView();
          } else {
            return const LandingView();}
        },
      ),
    );
  }
}
