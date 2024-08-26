import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';

class PrayTimeServices {
  void getPrayTime() {
    StorageService.setToLDB(
      keyInLDB: 'pray_times',
      apiLink:
          'https://api.aladhan.com/v1/timingsByCity/21-08-2024?city=cairo&country=egypt&method=8',
    );
  }

  Future<AzanModel> getDataFromDB() async {
    dynamic prayMap = await StorageService.getFromLDB(key: 'pray_times');
    AzanModel azan = AzanModel.fromJson(prayMap);
    return azan;
  }
}
