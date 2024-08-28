import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:intl/intl.dart';

class PrayTimeServices {
  void getPrayTime() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    StorageService.setToLDB(
      keyInLDB: 'pray_times',
      apiLink:
          'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=cairo&country=egypt&method=8',
    );
  }

  Future<AzanModel> getDataFromDB() async {
    dynamic prayMap = await StorageService.getFromLDB(key: 'pray_times');
    AzanModel azan = AzanModel.fromJson(prayMap);
    return azan;
  }
}
