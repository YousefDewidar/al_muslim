
import 'package:al_muslim/core/helper/location.dart';

import 'package:al_muslim/core/themes/theme_data.dart';

import 'package:flutter/material.dart';

import 'features/home/presentation/views/home_view.dart';

void main() async {
  runApp(const AlMuslim());
  GetLocationData()
      .getLocation(position: await Location().getCurrentLocation())!;
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المسلم',

      themeMode: ThemeMode.light,
      darkTheme: CustomThemeData.darkData(context),
      theme: CustomThemeData.lightData(context),
      home: const HomeView(),
    );
  }
}
