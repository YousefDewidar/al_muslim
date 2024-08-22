import 'package:al_muslim/core/networking/services.dart';
import 'package:al_muslim/core/utils/strings.dart';
import 'package:al_muslim/features/salah/data/model/day_data.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class SalahServices {
  Future<DayData> getDayData() async {
    DateTime now = DateTime.now(); // Or any other DateTime object
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    ApiServices(Dio()).setBaseUrl(baseUrl: ConstStrings.aladhanBaseUrl);

    Map<String, dynamic> data = await ApiServices(Dio()).getData(
        endPoint:
            'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=cairo&country=egypt&method=8');

    DayData dayData = DayData.fromJson(data);

    return dayData;
  }
}
