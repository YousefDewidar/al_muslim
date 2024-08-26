
import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:intl/intl.dart';

class SalahServices {
  void setDayData() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    StorageService.setToLDB(
        keyInLDB: 'salah',
        apiLink:
            'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=cairo&country=egypt&method=8');
  }

  Future<DayData> getDayDataFormLDB() async {
    var data = await StorageService.getFromLDB(key: 'salah');

    DayData dayData = DayData.fromJson(data);

    return dayData;
  }
}
