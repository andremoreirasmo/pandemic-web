// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPageStore on _LoginPageStoreBase, Store {
  final _$tokenAtom = Atom(name: '_LoginPageStoreBase.token');

  @override
  AdminToken get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(AdminToken value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$authenticateAsyncAction =
      AsyncAction('_LoginPageStoreBase.authenticate');

  @override
  Future authenticate(dynamic username, dynamic password) {
    return _$authenticateAsyncAction
        .run(() => super.authenticate(username, password));
  }

  @override
  String toString() {
    return '''
token: ${token}
    ''';
  }
}
