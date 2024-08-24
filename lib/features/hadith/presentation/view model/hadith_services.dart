import 'package:al_muslim/core/networking/services.dart';
import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';

class HadithServices {
  void setHadithInLDB({required String sahehName}) {
    StorageService.setToLDB(
      keyInLDB: sahehName,
      apiLink:
          'https://hadis-api-id.vercel.app/hadith/$sahehName?page=5&limit=60',
    );
  }

  Future<List<HadithModel>> getHadithFromLDB(
      {required String sahehName}) async {
    var data = await StorageService.getFromLDB(key: sahehName);

    List<HadithModel> hadithList = [];
    if (hadithList.isEmpty) {
      for (var element in data['items']) {
        hadithList.add(HadithModel.fromJson(element));
      }
    }
    return hadithList;
  }

  Future<List<HadithModel>> getHadithData({required String sahehName}) async {
    Map<String, dynamic> data = await ApiServices().getData(
        endPoint:
            'https://hadis-api-id.vercel.app/hadith/$sahehName?page=5&limit=60');

    List<HadithModel> hadithList = [];
    if (hadithList.isEmpty) {
      for (var element in data['items']) {
        hadithList.add(HadithModel.fromJson(element));
      }
    }

    return hadithList;
  }
}
