import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/repositories/login_repository.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/services/authentication.dart';
import 'package:pandemicweb/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_page.store.g.dart';

class LoginPageStore = _LoginPageStoreBase with _$LoginPageStore;

abstract class _LoginPageStoreBase with Store {
  //TextEditingController username = TextEditingController();
  //extEditingController password = TextEditingController();
  LoginRepository _loginRepository = LoginRepository();
  AuthService _authService = AuthService.instance;

  _LoginPageStoreBase() {
    initStore();
  }

  @action
  initStore() async {
    isLoading = true;
    var prefs = await SharedPreferences.getInstance();
    String tokenFromStorage = prefs.getString(StorageKeys.userToken);
    if (tokenFromStorage != null && tokenFromStorage.isNotEmpty) {
      navKey.currentState.pushNamed(Routes.admin_home);
    }

    isLoading = false;
  }

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String token;

  @observable
  bool isLoading = false;

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  authenticate() async {
    isLoading = true;
    var prefs = await SharedPreferences.getInstance();
    token = await _loginRepository.authenticate(username, password);
    print("TOKEN - >>>>>>>>>>>>>> ${token}");

    if (token != null) {
      _authService.setToken(token);

      await prefs.setString(StorageKeys.userToken, token);

      navKey.currentState.pushNamed(Routes.admin_home);
    }
    isLoading = false;
  }
}
