import 'dart:developer';

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
    String threeMonthsAgo =
        DateTime.now().subtract(Duration(days: 75)).toString();

    final response = await _httpClient.get(
        "https://api.covid19api.com/country/brazil/status/confirmed?from=2020-$threeMonthsAgo-01T00:00:00Z&to=${DateTime.now()}");

    if (response.statusCode == 200) {
      return {"success": true, "result": response.data};
    }

    return {"success": false};
  }
}
