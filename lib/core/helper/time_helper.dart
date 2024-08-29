import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:intl/intl.dart';

class TimeHelper {
  static Map prayTimes = {};

  static String time12({required String time}) {
    DateTime timesss = DateFormat("HH:mm").parse(time);
    String time12 = DateFormat("hh:mm a").format(timesss);
    String time12Arabic = time12.replaceAll("AM", "ص").replaceAll("PM", "م");
    return time12Arabic;
  }

  DateTime parsePrayerTime(String time) {
    final now = DateTime.now();
    final format = DateFormat.Hm(); // 'HH:mm'
    final dateTime = format.parse(time);

    return DateTime(
        now.year, now.month, now.day, dateTime.hour, dateTime.minute);
  }

  Future<Map<String, String>> getRemaindSalahinfo() async {
    DateTime now = DateTime.now();

    AzanModel azan = await PrayTimeServices().getDataFromDB();
    prayTimes = {
      'الفجر': azan.timings.fajr,
      'الظهر': azan.timings.dhuhr,
      'العصر': azan.timings.asr,
      'المغرب': azan.timings.maghrib,
      'العشاء': azan.timings.isha,
    };

    for (var pray in prayTimes.entries) {
      DateTime prayerDateTime = parsePrayerTime(pray.value);
      if (prayerDateTime.isAfter(now)) {
        final hour = int.parse(pray.value.split(':')[0]);
        final min = int.parse(pray.value.split(':')[1]);
        final dd = DateTime(now.year, now.month, now.day, hour, min, 0);
        String salahAfter =
            '${(now.hour - dd.hour).abs()}:${((now.minute - dd.minute).abs()).toString().padLeft(2, '0')}:${((60 - now.second).abs()).toString().padLeft(2, '0')}';
        String nextSalahName = pray.key;

        return {nextSalahName: salahAfter};
      }
    }
    return {'':''};
  }
}