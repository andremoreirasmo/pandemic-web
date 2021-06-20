import 'dart:convert';
import 'dart:io';

import 'package:pandemicweb/core/di/http_client.dart';

class ApiUrl {
  static final djangoapi = 'https://pandemicapi.herokuapp.com';
}

class AdminApiService {
  HttpClient _httpClient;

  AdminApiService() {
    _httpClient = HttpClient();
  }

  Future<Map<String, dynamic>> authenticate(username, password) async {
    var url = ApiUrl.djangoapi + "/api-token-auth/";
    try {
      var response = await _httpClient.post(
        url,
        body: jsonEncode(
            <String, String>{"username": username, "password": password}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        return {"success": true, "result": response.data};
      }
      return {"success": false, "result": response.data};
    } catch (error) {
      print(error);
    }
  }
}
