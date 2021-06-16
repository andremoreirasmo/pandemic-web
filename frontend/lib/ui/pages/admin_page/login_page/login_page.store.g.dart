// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPageStore on _LoginPageStoreBase, Store {
  final _$usernameAtom = Atom(name: '_LoginPageStoreBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginPageStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$tokenAtom = Atom(name: '_LoginPageStoreBase.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginPageStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$initStoreAsyncAction = AsyncAction('_LoginPageStoreBase.initStore');

  @override
  Future initStore() {
    return _$initStoreAsyncAction.run(() => super.initStore());
  }

  final _$authenticateAsyncAction =
      AsyncAction('_LoginPageStoreBase.authenticate');

  @override
  Future authenticate() {
    return _$authenticateAsyncAction.run(() => super.authenticate());
  }

  final _$_LoginPageStoreBaseActionController =
      ActionController(name: '_LoginPageStoreBase');

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_LoginPageStoreBaseActionController.startAction(
        name: '_LoginPageStoreBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_LoginPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginPageStoreBaseActionController.startAction(
        name: '_LoginPageStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
token: ${token},
isLoading: ${isLoading}
    ''';
  }
}
