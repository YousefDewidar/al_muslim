import 'dart:convert';
import 'dart:developer';

import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:dio/dio.dart';

class AzkarServices {
  final Dio dio = Dio();
  BaseOptions options = BaseOptions(
    baseUrl:
        'https://raw.githubusercontent.com/rn0x/Adhkar-json/main/adhkar.json',
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
  );
  Future<List<AzkarModel>> getAzkar() async {
    Response response = await dio.get(options.baseUrl);
    List<dynamic> data = jsonDecode(response.data);

    List<AzkarModel> azkarModelList = [];
    for (Map<String, dynamic> azan in data) {
      AzkarModel oneZekr = AzkarModel.fromJson(azan);
      azkarModelList.add(oneZekr);
    }
    log(azkarModelList[0].category.toString());
    return azkarModelList;
  }
}
