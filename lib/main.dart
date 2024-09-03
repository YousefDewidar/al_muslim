import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/notification/noti_service.dart';
import 'package:al_muslim/core/themes/theme_data.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/landing/landing_view.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const AlMuslim());
  
  //?azkar Category services
  AzkarServices().getAllCategory();
  //? all azkar info services
  AzkarServices().getAllAzkarInfo(0);
  // ReactersServices().fetchReacters();
  // //?pray time services
  // PrayTimeServices().getPrayTime();
  // //?call all swar services
  FehresService().getAllSwar();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await NotificationService.initNotification();
}

class AlMuslim extends StatefulWidget {
  const AlMuslim({super.key});

  @override
  State<AlMuslim> createState() => _AlMuslimState();
}

class _AlMuslimState extends State<AlMuslim> {
  bool hasSeenLandingPage = false;

  @override
  void initState() {
    super.initState();
    _checkLandingPage();
  }
//saveLocation in local 
  Future<void> _checkLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hasSeenLandingPage = prefs.getBool('hasSeenLandingPage') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingCubit(),
        ),
        BlocProvider(
          create: (context) => FavCubit(),
        ),
      ],
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          BlocProvider.of<SettingCubit>(context).initialDataFromLDB();
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'المسلم',
              themeMode: BlocProvider.of<SettingCubit>(context).myTheme,
              darkTheme:
                  CustomThemeData(BlocProvider.of<SettingCubit>(context).myFont)
                      .darkData(context),
              theme:
                  CustomThemeData(BlocProvider.of<SettingCubit>(context).myFont)
                      .lightData(context),
              home:
               FutureBuilder(
                //Todo: اتوقع في غلط هنا
                //?done
                //Todo:  عاوزك تحط الموقع في لوكال ولو موجود هاته لو مش موجود افتح الموقع وهاته
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

  Widget StartPage() {
    if (hasSeenLandingPage == true) {
      return const HomeView();
    } else {
      return const LandingView();
    }
  }
}
