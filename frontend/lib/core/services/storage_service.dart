import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static const String userToken = "TOKEN_USER";
}

class StorageService {
  SharedPreferences prefs;

  static Future<SharedPreferences> getPrefsInstance() async {
    return await SharedPreferences.getInstance();
  }
}
