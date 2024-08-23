import 'package:al_muslim/core/networking/services.dart';
import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';

class HadithServices {
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
