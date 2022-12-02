import 'package:untitled2/data/models/api_model/top_level/top_level.dart';
import 'package:untitled2/data/services/api_service.dart';

class Repository {
  Repository({required OpenApiService openApiService})
      : _openApiService = openApiService;
  final OpenApiService _openApiService;

  Future<TopLevelModel> getAllData() async =>
      _openApiService.getAllData();
}
