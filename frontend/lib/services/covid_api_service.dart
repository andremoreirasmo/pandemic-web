import 'package:pandemicweb/core/services/http_client.dart';

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
}