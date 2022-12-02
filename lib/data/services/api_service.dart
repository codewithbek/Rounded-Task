import 'package:dio/dio.dart';
import 'package:untitled2/data/models/api_model/top_level/top_level.dart';
import 'package:untitled2/data/services/api_client.dart';

class OpenApiService {
  OpenApiService({required OpenApiClient openApiClient})
      : _openApiClient = openApiClient;

  final OpenApiClient _openApiClient;

  Future<List<TopLevelModel>> getAllData() async {
    try {
      Response response =
          await _openApiClient.dio.get(_openApiClient.dio.options.baseUrl);
      if (response.statusCode! <= 200 || response.statusCode! <= 299) {
        return (response.data as List?)
                ?.map((category) => TopLevelModel.fromJson(category))
                .toList() ??
            [];
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
