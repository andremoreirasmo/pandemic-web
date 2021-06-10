import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/repositories/login_repository.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/services/authentication.dart';
part 'login_page.store.g.dart';

class LoginPageStore = _LoginPageStoreBase with _$LoginPageStore;

abstract class _LoginPageStoreBase with Store {

    
  //TextEditingController username = TextEditingController();
  //extEditingController password = TextEditingController();
  LoginRepository _loginRepository = LoginRepository();
  AuthService _authService = AuthService.instance;

  @observable
  String username = '';

  @observable
  String password = '';


  @observable
  String token;


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
    token = await _loginRepository.authenticate(username,password);
    print("TOKEN - >>>>>>>>>>>>>> ${token}");

    if(token != null) { 
      _authService.setToken(token);
      navKey.currentState.pushNamed(Routes.admin_home);
    }
  }

 

}
