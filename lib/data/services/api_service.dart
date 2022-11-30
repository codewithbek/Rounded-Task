import 'package:dio/dio.dart';
import 'package:untitled2/data/models/api_model/top_level/top_level.dart';

class ApiService {
  Future<List<TopLevelModel>> getAllData() async {
    try {
      Response response =
          await Dio().get("https://nbu.uz/en/exchange-rates/json/");
      return (response.data as List?)
              ?.map((category) => TopLevelModel.fromJson(category))
              .toList() ??
          [];
    } on DioError catch (e) {
      throw e;
    }
  }
}
