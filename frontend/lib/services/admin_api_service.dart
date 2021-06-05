import 'dart:convert';
import 'dart:io';

import 'package:pandemicweb/core/services/http_client.dart';
import 'package:pandemicweb/services/_url.dart';
import 'package:http/http.dart' as http;

class AdminApiService {
  HttpClient _httpClient;

  AdminApiService() {
    _httpClient = HttpClient();
  }

  Future<Map<String, dynamic>> authenticate(username, password) async {
    var url = "http://" + ApiUrl.djangoapi + "/api-token-auth/";
    try {
      var response = await http
          .post(Uri.parse(url) 
          ,headers: <String,String> {
            'Content-Type': 'application/json'
          }
          ,body: jsonEncode(<String,String>{
            "username": username
            ,"password": password
          }),
          );
    
    
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return {"success": true, "result": response.body};
      }
      return {"success": false};
    } catch (error) {
      print(error);
    }
  }

}
