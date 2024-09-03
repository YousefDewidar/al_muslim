
import 'package:dio/dio.dart';

class MasrQuranServices {
  Dio dio = Dio();
  Future<String> fetchUrl() async {
    Response response =
        await dio.get('https://data-rosy.vercel.app/radio.json');
    String url = response.data['radios'][18]['url'];
    return url;
  }
}
