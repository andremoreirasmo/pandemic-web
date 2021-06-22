import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pandemicweb/core/di/http_client.dart';
import 'package:pandemicweb/core/services/auth_service.dart';
import 'package:pandemicweb/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

      if ((response.statusCode == 200) || (response.statusCode == 201)) {
        return {"success": true, "result": response.data};
      }
      return {"success": false, "result": response.data};
    } catch (error) {
      print(error);
    }
  }

  Future<Map<String, dynamic>> getOrientations() async {
    var url = ApiUrl.djangoapi + "/orientation/";
    final response = await _httpClient.get(url);
    if (response.statusCode == 200) {
      return {"success": true, "result": response.data};
    }
    return {"success": false};
  }

  Future<Map<String, dynamic>> getSymptoms() async {
    var url = ApiUrl.djangoapi + "/symptom/";
    final response = await _httpClient.get(url);
    if (response.statusCode == 200) {
      return {"success": true, "result": response.data};
    }
    return {"success": false};
  }

  Future<Map<String, dynamic>> addSymptom(String description) async {
    var url = ApiUrl.djangoapi + "/symptom/";

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(StorageKeys.userToken);

    final response = await _httpClient.post(
      url,
      body: jsonEncode({'des_sym': description}),
      options: Options(
          headers: {'Authorization': 'Token ' + token},
          receiveTimeout: 60 * 1000,
          sendTimeout: 60 * 1000,
          validateStatus: (status) {
            return status <= 500;
          }),
    );
    if (response.data['id_sym'] != null) {
      return {"success": true, "data": response.data};
    }
    return {"sucess": false};
  }

  Future<bool> removeSymptom(String id) async {
    var url = ApiUrl.djangoapi + "/symptom/$id";

    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(StorageKeys.userToken);

    final response = await _httpClient.delete(
      url,
      options: Options(
          headers: {'Authorization': 'Token ' + token},
          receiveTimeout: 60 * 1000,
          sendTimeout: 60 * 1000,
          validateStatus: (status) {
            return status <= 500;
          }),
    );
    if (response.statusCode == 204) {
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>> createOrientation(title, description) async {
    var url = ApiUrl.djangoapi + "/orientation/";
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = await prefs.getString('TOKEN_USER');
      print('token : ' + token);
      var response = await _httpClient.post(
        url,
        body: jsonEncode(
            <String, String>{'nam_ori': title, 'des_ori': description}),
        options: Options(
            headers: {'Authorization': 'Token ' + token},
            receiveTimeout: 60 * 1000,
            sendTimeout: 60 * 1000,
            validateStatus: (status) {
              return status <= 500;
            }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == 200) {
        return {"success": true, "result": response.data};
      } else if (response.statusCode == 201) {
        return {"success": true, "result": response.data};
      }
      return {"success": false, "result": response.data};
    } catch (error) {
      print(error);
    }
  }
}
