import 'package:al_muslim/core/utils/constants.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:dio/dio.dart';

class AzanServices {
  late Dio dio;
  //!!to be continioed
  late DateHijri date;
  AzanServices() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.kBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<AzanModel> getAzanTime() async {
    Response response = await dio.get(
      'https://api.aladhan.com/v1/timingsByCity/21-08-2024?city=cairo&country=egypt&method=8',
    );
    AzanModel azan = AzanModel.fromJson(response.data);
    //!to be continioed
    //  date = DateHijri.fromJson(response.data);
    return azan;
  }
}
