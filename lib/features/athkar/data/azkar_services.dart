import 'dart:convert';

import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:dio/dio.dart';

class AzkarServices {
  final Dio dio = Dio();
  BaseOptions options = BaseOptions(
    baseUrl:
        'https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json',
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
  );
  Future<List<AzkarModel>> getAzkar({required int categoryType}) async {
    //! response as String
    Response response = await dio.get(options.baseUrl);
    //! resopnse as Map
    Map<String, dynamic> responseKeys = jsonDecode(response.data);

    List azkarCategory = responseKeys.keys.toList();
    //!list of all response as List<map>
    List<Map<String, dynamic>> morningAzkarList = [];
    for (var item in jsonDecode(response.data)[azkarCategory[categoryType]]) {
      morningAzkarList.add(item);
    }
    //!list of all response as list<azkarModel>
    List<AzkarModel> azkarModelList = [];
    for (Map<String, dynamic> azan in morningAzkarList) {
      AzkarModel oneZekr = AzkarModel.fromJson(azan);
      azkarModelList.add(oneZekr);
    }
    return azkarModelList;
  }

  Future<List<String>> getAllCategory() async {
    final Dio dio = Dio();
    BaseOptions options = BaseOptions(
      baseUrl:
          'https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    );
    Response response = await dio.get(options.baseUrl);
    Map<String, dynamic> responseKeys = jsonDecode(response.data);
    List<String> azkarCategory = responseKeys.keys.toList();
    return azkarCategory;
  }
}
