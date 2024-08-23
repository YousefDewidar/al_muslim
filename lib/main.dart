import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/landing_view.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as nav;
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  runApp(const AlMuslim());
  PrayTimeServices().getPrayTime();
  AzkarServices().getAzkarAsString();
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    // القيم الابتدائية هتبقا قيم من لوكال
    ThemeMode myTheme = ThemeMode.light;
    double myFont = 20.0;
    bool hasPermision = false;
    Future getPermision() async {
      if (await Permission.location.serviceStatus.isEnabled) {
        var status = await Permission.location.status;
        if (status.isGranted) {
          hasPermision = true;
        } else {
          Permission.location.request().then((val) {
            hasPermision = (val == PermissionStatus.granted);
          });
        }
      }
    }

    return BlocProvider(
      create: (context) => SettingCubit(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state is ThemeChangedState) {
            myTheme = state.theme;
          }
          if (state is FontChangedState) {
            myFont = state.font;
          }
        },
        builder: (context, state) {
          return GetMaterialApp(
            defaultTransition: nav.Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 400),
            debugShowCheckedModeBanner: false,
            title: 'المسلم',
            themeMode: myTheme,
            darkTheme: CustomThemeData(myFont).darkData(context),
            theme: CustomThemeData(myFont).lightData(context),
            home: FutureBuilder(
              future: getPermision(),
              builder: (contex, snapshot) {
                if (hasPermision) {
                  return const HomeView();
                } else {
                  return const LandingView();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
