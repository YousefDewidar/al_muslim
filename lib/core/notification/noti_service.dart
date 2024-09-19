import 'dart:async';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static Future<void> initNotification() async {
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if (!isAllowed) {
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    await AwesomeNotifications().initialize(
      'resource://drawable/noti',
      [
        NotificationChannel(
          channelKey: 'basic key',
          channelName: 'Basic notification',
          channelDescription: 'noti channel testtt',
          importance: NotificationImportance.High,
          playSound: true,
          channelShowBadge: true,
        ),
      ],
    );
  }

  static Future<void> createNotification() async {
    DayData dayData = await SalahServices().getDayDataFormLDB();
    DateTime fajr = convertFromStringToData(salah: dayData.salah.fajr);
    DateTime dhuhr = convertFromStringToData(salah: dayData.salah.dhuhr);
    DateTime asr = convertFromStringToData(salah: dayData.salah.asr);
    DateTime maghrib = convertFromStringToData(salah: dayData.salah.maghrib);
    DateTime isha = convertFromStringToData(salah: dayData.salah.isha);

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic key',
        title: 'أذان الفجر',
        body: 'يحين الآن موعد اذان الفجر',
      ),
      schedule: NotificationCalendar.fromDate(
          repeats: true, date: fajr.subtract(const Duration(minutes: 4))),
    );
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 2,
          channelKey: 'basic key',
          title: 'أذان الظهر',
          body: 'يحين الآن موعد اذان الظهر',
        ),
        schedule: NotificationCalendar.fromDate(
            date: dhuhr.subtract(const Duration(minutes: 4))));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 3,
          channelKey: 'basic key',
          title: 'أذان العصر',
          body: 'يحين الآن موعد اذان العصر',
        ),
        schedule: NotificationCalendar.fromDate(
            date: asr.subtract(const Duration(minutes: 4))));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 4,
          channelKey: 'basic key',
          title: 'أذان المغرب',
          body: 'يحين الآن موعد اذان المغرب',
        ),
        schedule: NotificationCalendar.fromDate(
            date: maghrib.subtract(const Duration(minutes: 4))));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 5,
          channelKey: 'basic key',
          title: 'أذان العشاء',
          body: 'يحين الآن موعد اذان العشاء ',
        ),
        schedule: NotificationCalendar.fromDate(
            date: isha.subtract(const Duration(minutes: 4))));
  }

  static DateTime convertFromStringToData({required String salah}) {
    List<String> parts = salah.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    DateTime now = DateTime.now();

    DateTime notifyDateTime =
        DateTime(now.year, now.month, now.day, hour, minute);

    return notifyDateTime;
  }
}
