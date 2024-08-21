import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlMuslim());
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المسلم',
      themeMode: ThemeMode.dark,
      darkTheme: CustomThemeData.darkData(context),
      theme: CustomThemeData.lightData(context),
      home: const HomeView(),
    );
  }
}
