import 'package:pandemicweb/core/di/http_client.dart';

class ApiService {
  HttpClient _httpClient;

  ApiService() {
    _httpClient = HttpClient();
  }

  Future<Map<String, dynamic>> getWorldCases() async {
    final response =
        await _httpClient.get("https://api.covid19api.com/world/total");

    if (response.statusCode == 200) {
      return {"success": true, "result": response.data};
    }

    return {"success": false};
  }

  Future<Map<String, dynamic>> getBrazilCases() async {
    final response = await _httpClient.get(
        "https://api.covid19api.com/country/brazil/status/confirmed?from=${DateTime.now()}&to=${DateTime.now()}");

    if (response.statusCode == 200) {
      return {"success": true, "result": response.data};
    }

    return {"success": false};
  }
}
