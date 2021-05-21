import 'package:pandemicweb/models/cases.model.dart';
import 'package:pandemicweb/services/covid_api_service.dart';

class CovidRepository {
  ApiService _apiService = ApiService();

  Future<WorldCases> fetchWorldCases() async {
    final data = await _apiService.getWorldCases();

    if (data.containsKey("success") && data['success'] == true) {
      return WorldCases.fromJson(data['result']);
    }

    return WorldCases.fromJson({});
  }
}
