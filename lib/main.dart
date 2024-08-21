import 'package:al_muslim/core/helper/location.dart';
import 'package:flutter/material.dart';

import 'features/home/presentation/views/home_view.dart';

void main() async{
  runApp(const AlMuslim());
  GetLocationData().getLocation(position: await Location().getCurrentLocation())!;
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المسلم',
      theme: ThemeData(),
      home:const HomeView(),
    );
  }
}
