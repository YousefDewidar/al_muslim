import 'package:dio/dio.dart';

class ApiServices {
  Dio dio;
  ApiServices(this.dio);

  void setBaseUrl({required String baseUrl}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  getData({required String endPoint}) async {
    Response response = await dio.get(
      endPoint,
    );

    return response.data;
  }
}
