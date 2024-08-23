import 'dart:convert';
import 'dart:developer';

import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AzkarServices {
  final Dio dio = Dio();
  BaseOptions options = BaseOptions(
    baseUrl:
        'https://raw.githubusercontent.com/rn0x/Adhkar-json/main/adhkar.json',
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
  );

  //!//! سيبها يا يوسف محتاجها بعدين

  // Future<List<AzkarModel>> getAzkar() async {
  //   Response response = await dio.get(options.baseUrl);
  //   List<dynamic> data = jsonDecode(response.data);

  //   List<AzkarModel> azkarModelList = [];
  //   for (Map<String, dynamic> azan in data) {
  //     AzkarModel oneZekr = AzkarModel.fromJson(azan);
  //     azkarModelList.add(oneZekr);
  //   }
  //   log(azkarModelList[0].category.toString());
  //   return azkarModelList;
  // }
//!
  //##################
  Future<String> getAzkarAsString() async {
    Response response = await dio.get(options.baseUrl);
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setString('all_azkar',response.data);
    return response.data;
  }
    Future<List<AzkarModel>> getAzkar() async {
      
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    String dataAll=asyncPref.getString('all_azkar')??'';
    List<dynamic> data = jsonDecode(dataAll);

    List<AzkarModel> azkarModelList = [];
    for (Map<String, dynamic> azan in data) {
      AzkarModel oneZekr = AzkarModel.fromJson(azan);
      azkarModelList.add(oneZekr);
    }
    log(azkarModelList[0].category.toString());
    return azkarModelList;
  }


}


//! سيبها يا يوسف محتاجها بعدين
  // Future<List<AzkarModel>> getAllAzkar() async {
  //   SharedPreferences asyncPref = await SharedPreferences.getInstance();
  //   String allAzkar = asyncPref.getString('all_azkar') ?? '';
  //   var allList = jsonDecode(allAzkar);
  //   log(allList.runtimeType.toString());

  //   List<AzkarModel> azkarModelList = [];
  //   for (Map<String, dynamic> azan in allList) {
  //     AzkarModel oneZekr = AzkarModel.fromJson(azan);
  //     azkarModelList.add(oneZekr);
  //   }
  //   log(azkarModelList.runtimeType.toString());
  //   return azkarModelList;
  // }