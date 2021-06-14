// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_home_page.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminHomePageStore on _AdminHomePageStoreBase, Store {
  final _$worldCasesAtom = Atom(name: '_AdminHomePageStoreBase.worldCases');

  @override
  WorldCases get worldCases {
    _$worldCasesAtom.reportRead();
    return super.worldCases;
  }

  @override
  set worldCases(WorldCases value) {
    _$worldCasesAtom.reportWrite(value, super.worldCases, () {
      super.worldCases = value;
    });
  }

  final _$fetchAllDataAsyncAction =
      AsyncAction('_AdminHomePageStoreBase.fetchAllData');

  @override
  Future fetchAllData() {
    return _$fetchAllDataAsyncAction.run(() => super.fetchAllData());
  }

  final _$_AdminHomePageStoreBaseActionController =
      ActionController(name: '_AdminHomePageStoreBase');

  @override
  dynamic initStore() {
    final _$actionInfo = _$_AdminHomePageStoreBaseActionController.startAction(
        name: '_AdminHomePageStoreBase.initStore');
    try {
      return super.initStore();
    } finally {
      _$_AdminHomePageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
worldCases: ${worldCases}
    ''';
  }
}
