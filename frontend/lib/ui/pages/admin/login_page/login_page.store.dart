import 'package:mobx/mobx.dart';
import 'package:pandemicweb/models/admin.token.model.dart';
import 'package:pandemicweb/repositories/login_repository.dart';
part 'login_page.store.g.dart';

class LoginPageStore = _LoginPageStoreBase with _$LoginPageStore;

abstract class _LoginPageStoreBase with Store {
  LoginRepository _loginRepository = LoginRepository();


  @observable
  AdminToken token;


  @action
  authenticate(username,password) async {
    token = await _loginRepository.authenticate(username,password);
    print("TOKEN - >>>>>>>>>>>>>>. ${token}");
  
  }
}
