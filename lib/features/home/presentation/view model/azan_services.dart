import 'package:al_muslim/core/networking/services.dart';
import 'package:al_muslim/core/utils/strings.dart';
import 'package:al_muslim/features/home/data/model/azan_model.dart';

class AzanServices {
  Future<AzanModel> getAzanTime() async {
    ApiServices().setBaseUrl(baseUrl: ConstStrings.aladhanBaseUrl);

    var data = await ApiServices().getData(
        endPoint:
            'https://api.aladhan.com/v1/timingsByCity/21-08-2024?city=cairo&country=egypt&method=8');

    AzanModel azan = AzanModel.fromJson(data);
    return azan;
  }
}
