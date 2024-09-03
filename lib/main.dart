import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/notification/noti_service.dart';
import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/landing_view.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as nav;
import 'package:get/get_navigation/src/root/get_material_app.dart';

//Todo:  متنساش تمسح اي صوره انت ضيفتها ومستخدمتهاش

void main() async {
  runApp(const AlMuslim());
  // ReactersServices().fetchReacters();
  // //? call azkar for the first time
  // //?pray time services
  // PrayTimeServices().getPrayTime();
  // //?call all swar services
  // FehresService().getAllSwar();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await NotificationService.initNotification();
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingCubit(),
        ),
        // BlocProvider(
        //   create: (context) => FavCubit(),
        // ),
      ],
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          BlocProvider.of<SettingCubit>(context).initialDataFromLDB();
          return GetMaterialApp(
            defaultTransition: nav.Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 400),
            debugShowCheckedModeBanner: false,
            title: 'المسلم',
            themeMode: BlocProvider.of<SettingCubit>(context).myTheme,
            darkTheme:
                CustomThemeData(BlocProvider.of<SettingCubit>(context).myFont)
                    .darkData(context),
            theme:
                CustomThemeData(BlocProvider.of<SettingCubit>(context).myFont)
                    .lightData(context),
            home: FutureBuilder(
              //Todo: اتوقع في غلط هنا
              //Todo:   عاوزك تحط الموقع في لوكال ولو موجود هاته لو مش موجود افتح الموقع وهاته
              //Todo:  هنعمل الكلام دا مع بعض
              future: Location().getPermision(),
              builder: (contex, snapshot) {
                if (Location.hasPermision) {
                  return const HomeView();
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Scaffold(
                      body: Center(child: CircularProgressIndicator()));
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
