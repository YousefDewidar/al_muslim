import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const AlMuslim());
  GetLocationData()
      .getLocation(position: await Location().getCurrentLocation())!;
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
      debugShowCheckedModeBanner: false,
      title: 'المسلم',
      themeMode: ThemeMode.dark,
      darkTheme: CustomThemeData.darkData(context),
      theme: CustomThemeData.lightData(context),
      home: const HomeView(),
    );
  }
}
