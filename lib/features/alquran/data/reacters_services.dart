import 'dart:developer';

import 'package:al_muslim/features/alquran/data/model/reacters_model.dart';
import 'package:dio/dio.dart';

class ReactersServices {
  Dio dio = Dio();
  Future<List<ReactersModel>> fetchReacters() async {
    Response response = await dio.get('https://mp3quran.net/api/v3/reciters');
    //response.data==Map<String,dynamic>
    List<Map<String, dynamic>> reacters = [];
    for (var item in response.data['reciters']) {
      reacters.add(item);
    }
    log(reacters.length.toString());
    List<ReactersModel> reactersdata = [];
    for (int i = 0; i < reacters.length; i++) {
      reactersdata.add(ReactersModel.fromJson(reacters[i]));
    }
    return reactersdata;
  }
}
