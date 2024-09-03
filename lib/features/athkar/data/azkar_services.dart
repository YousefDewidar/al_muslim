import 'dart:convert';
import 'dart:developer';
import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_cateogry_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AzkarServices {
  Dio dio = Dio();

  getAllCategory() async {
    Response response = await dio.get(
        'https://raw.githubusercontent.com/rn0x/Adhkar-json/main/adhkar.json');
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('category', response.data);
  }

  Future<List<AzkarCategoryModel>> getCategoryFromDB() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String data = pref.getString('category')!;
    List<dynamic> dataList = jsonDecode(data);
    log(data.runtimeType.toString());

    List<AzkarCategoryModel> categries = [];
    for (Map<String, dynamic> item in dataList) {
      AzkarCategoryModel category = AzkarCategoryModel.fromJson(item);
      categries.add(category);
    }
    return categries;
  }

  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  getAllAzkarInfo(startIndex) async {
    Response response = await dio.get(
        'https://raw.githubusercontent.com/rn0x/Adhkar-json/main/adhkar.json');
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('allAzkarInfo', response.data);
  }

  Future<List<AllAzkarModel>> getAllInfoFromDB(startIndex) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String data = pref.getString('allAzkarInfo')!;
    List<dynamic> dataList = jsonDecode(data);

    List<AllAzkarModel> info = [];
    for (Map<String, dynamic> item in dataList[startIndex]['array']) {
      AllAzkarModel da = AllAzkarModel.fromJson(item);
      info.add(da);
    }

    return info;
  }
}
