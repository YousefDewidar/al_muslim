import 'package:al_muslim/core/notification/noti_service.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:al_muslim/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const AlMuslim());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await NotificationService.initNotification();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool notificationsSet = prefs.getBool('notifications_set') ?? false;

  if (!notificationsSet) {
    await SalahServices().setDayData();
    // إعداد إشعارات الصلاة لأول مرة
    await NotificationService.createPrayerNotifications();
    // تخزين أن الإشعارات قد تم إعدادها
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
