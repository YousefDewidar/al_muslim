import 'dart:convert';
import 'dart:developer';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayTimeServices {
  Dio dio = Dio();
  //?function to get data from api and store in local db
  Future<String> getPrayTime() async {
    Response response = await dio.get(
        'https://api.aladhan.com/v1/timingsByCity/21-08-2024?city=cairo&country=egypt&method=8');
    String data = jsonEncode(response.data);
    log(response.data.runtimeType.toString()); //? type is Map<String,dynamic>
    //?here start to save data to local database 
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setString('pray_times', data);
    return data;
  }
  //?function to get data from local db & show in futurebuilder //! this is function uses in futurebuilder
  Future<AzanModel> getDataFromDB() async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    String prayTime = asyncPref.getString('pray_times') ?? '';
    Map<String, dynamic> prayMap = jsonDecode(prayTime);
    AzanModel azan = AzanModel.fromJson(prayMap);
    return azan;
  }
}
