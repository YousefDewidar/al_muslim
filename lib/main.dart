import 'package:al_muslim/core/notification/noti_service.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


// انا موقف شير السور مؤقت

void main() async {
  const bool isRelease = bool.fromEnvironment('dart.vm.product');
  if (isRelease) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://520ab0a8f022f75c3da49bda48dac1a9@o4508058332299264.ingest.de.sentry.io/4508058334396496';
      },
      appRunner: () => runApp(const AlMuslim()),
    );
  } else {
    runApp(const AlMuslim());
  }

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await NotificationService.initNotification();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool notificationsSet = prefs.getBool('notifications_set') ?? false;

  if (!notificationsSet) {
    await SalahServices().setDayData();
    await NotificationService.createPrayerNotifications();
    prefs.setBool('notifications_set', true);
  }
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
        BlocProvider(
          create: (context) => FavCubit(),
        ),
      ],
      child: const MainWidget(),
    );
  }
}
