class AuthService {

  AuthService._privateConstructor();

  static final AuthService _instance = AuthService._privateConstructor();

  static AuthService get instance => _instance;

  String token;

  setToken(value) { 
    token = value;
  }

  getToken() {
    return token;
  }

}
