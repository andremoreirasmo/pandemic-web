import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/core/repositories/api_repository.dart';
import 'package:pandemicweb/core/services/auth_service.dart';
import 'package:pandemicweb/core/services/storage_service.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_page.store.g.dart';

class LoginPageStore = _LoginPageStoreBase with _$LoginPageStore;

abstract class _LoginPageStoreBase with Store {
  //TextEditingController username = TextEditingController();
  //extEditingController password = TextEditingController();
  ApiRepository _loginRepository = ApiRepository();
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

  @observable
  String onErrorMessage = '';

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
    onErrorMessage = '';

    var prefs = await SharedPreferences.getInstance();
    token = await _loginRepository.authenticate(username, password);
    print("TOKEN - >>>>>>>>>>>>>> ${token}");

    if (token != null) {
      _authService.setToken(token);
      await prefs.setString(StorageKeys.userToken, token);

      navKey.currentState.pushNamed(Routes.admin_home);
    } else {
      onErrorMessage = 'Algum erro ocorreu ao tentar logar';
    }
    isLoading = false;
  }
}
