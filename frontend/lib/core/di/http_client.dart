import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {
  Dio _client;

  HttpClient({List<Interceptor> interceptors}) {
    _client = Dio();

    _client.options.connectTimeout = 30000; //30s
    _client.options.receiveTimeout = 10000;
    if (interceptors != null && interceptors.length > 0) {
      _client.interceptors.addAll(interceptors);
    }
  }

  Future<Response> get(String url,
      {Map<String, dynamic> queryParameters = const {}}) {
    Options options = Options(validateStatus: (status) {
      return status <= 500;
    });

    return _client.get(url, options: options, queryParameters: queryParameters);
  }

  Future<Response> post(String url, {dynamic body, Options options}) {
    if (options == null) {
      options = Options(
          receiveTimeout: 60 * 1000,
          sendTimeout: 60 * 1000,
          validateStatus: (status) {
            return status <= 500;
          });
    }
    return _client.post(url, data: body, options: options);
  }

  Future<Response> put(String url, {dynamic body}) {
    Options options = Options(validateStatus: (status) {
      return status <= 500;
    });
    return _client.put(url, data: body, options: options);
  }

  Future<Response> delete(String url, {dynamic body, Options options}) {
    if (options == null) {
      options = Options(
          receiveTimeout: 60 * 1000,
          sendTimeout: 60 * 1000,
          validateStatus: (status) {
            return status <= 500;
          });
    }
    // Options options = Options(validateStatus: (status) {
    //   return status <= 500;
    // });
    return _client.delete(url, options: options);
  }
}
