import 'dart:convert';
import 'package:al_muslim/features/alquran/data/model/tafser_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TafserServices {
  Dio dio = Dio();
  late  int swrahNum;
  getAllTafser() async {
    Response response = await dio.get(
        'https://quranenc.com/api/v1/translation/sura/arabic_moyassar/2');
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('tafser', jsonEncode(response.data));
  }

  Future<List<TafserModel>> getFromDataBase() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> response = jsonDecode(pref.getString('tafser') ?? '');

    List<Map<String, dynamic>> tafserMap = [];
    for (var item in response['result']) {
      tafserMap.add(item);
    }
    List<TafserModel> tafserList = [];
    for (var item in tafserMap) {
      tafserList.add(TafserModel.fromJson(item));
    }
    return tafserList;
  }
}
