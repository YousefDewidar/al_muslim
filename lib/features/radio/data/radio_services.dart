import 'dart:developer';

import 'package:al_muslim/features/radio/data/model/radio_model.dart';
import 'package:dio/dio.dart';

class RadioServices {
  Dio dio = Dio();
  Future<List<RadioModel>> getRadioData() async {
    Response response =
        await dio.get('https://mp3quran.net/api/v3/radios?language=ar');
    log(response.data.runtimeType.toString());

    List<Map<String, dynamic>> allRadios = [];
    for (Map<String, dynamic> item in response.data['radios']) {
      allRadios.add(item);
    }
    List<RadioModel> radios = [];
    for (int i = 0; i < allRadios.length; i++) {
      radios.add(RadioModel.fromJson(allRadios[i]));
    }
    return radios;
  }
}
