import 'dart:convert';
import 'dart:developer';
import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_cateogry_model.dart';
import 'package:dio/dio.dart';


class AzkarServices {
  Dio dio = Dio();

  Future<List<AzkarCategoryModel>> getAllCategory() async {
    Response response = await dio.get(
        'https://raw.githubusercontent.com/rn0x/Adhkar-json/main/adhkar.json');
    List<dynamic> data = jsonDecode(response.data);

    List<AzkarCategoryModel> categries = [];
    for (Map<String, dynamic> item in data) {
      AzkarCategoryModel category = AzkarCategoryModel.fromJson(item);
      categries.add(category);
    }
    return categries;
  }

  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Future<List<AllAzkarModel>> getAllAzkarInfo(startIndex) async {
    Response response = await dio.get(
        'https://raw.githubusercontent.com/rn0x/Adhkar-json/main/adhkar.json');
    List<dynamic> data = jsonDecode(response.data);

    List<AllAzkarModel> info = [];
    //replace  0  with the page you Enter
    for (Map<String, dynamic> item in data[startIndex]['array']) {
      AllAzkarModel da = AllAzkarModel.fromJson(item);
      info.add(da);
    }
    log(info[0].text);

    return info;
  }
}
