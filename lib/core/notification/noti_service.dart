import 'package:al_muslim/core/helper/location.dart' as loc;
import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
      null,
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
    // await createNotification();
  }

  static Future<void> createNotification() async {
    DayData dayData = await SalahServices().getDayDataFormLDB();
    DateTime fajr = convertFromStringToData(salah: dayData.salah.fajr);
    DateTime dhuhr = convertFromStringToData(salah: dayData.salah.dhuhr);
    DateTime asr = convertFromStringToData(salah: dayData.salah.asr);
    DateTime maghrib = convertFromStringToData(salah: dayData.salah.maghrib);
    DateTime isha = convertFromStringToData(salah: dayData.salah.isha);
    String loc = await getLoc();

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic key',
        title: 'أذان الفجر',
        body: 'يحين الآن موعد اذان الفجر حسب توقيت $loc',
      ),
      schedule: NotificationCalendar.fromDate(repeats: true, date: fajr),
    );
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 2,
          channelKey: 'basic key',
          title: 'أذان الظهر',
          body: 'يحين الآن موعد اذان الظهر حسب توقيت $loc',
        ),
        schedule: NotificationCalendar.fromDate(date: dhuhr));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 3,
          channelKey: 'basic key',
          title: 'أذان العصر',
          body: 'يحين الآن موعد اذان العصر حسب توقيت $loc',
        ),
        schedule: NotificationCalendar.fromDate(date: asr));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 4,
          channelKey: 'basic key',
          title: 'أذان المغرب',
          body: 'يحين الآن موعد اذان المغرب حسب توقيت $loc',
        ),
        schedule: NotificationCalendar.fromDate(date: maghrib));
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 5,
          channelKey: 'basic key',
          title: 'أذان العشاء',
          body: 'يحين الآن موعد اذان العشاء حسب توقيت $loc',
        ),
        schedule: NotificationCalendar.fromDate(date: isha));
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

  static Future<String> getLoc() async {
    Position? pos = await loc.Location().getCurrentLocation();
    if (pos != null) {
      List<Placemark> curLoc =
          await GetLocationData().getLocation(position: pos);
      return curLoc.first.locality!;
    }
    return 'فشل تحديد موقعك';
  }
}
