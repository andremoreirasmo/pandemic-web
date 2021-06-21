// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_symptoms.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminSymptomsStore on _AdminSymptomsStoreBase, Store {
  final _$currentSymptomAtom =
      Atom(name: '_AdminSymptomsStoreBase.currentSymptom');

  @override
  String get currentSymptom {
    _$currentSymptomAtom.reportRead();
    return super.currentSymptom;
  }

  @override
  set currentSymptom(String value) {
    _$currentSymptomAtom.reportWrite(value, super.currentSymptom, () {
      super.currentSymptom = value;
    });
  }

  final _$showItemOptionsOfAtom =
      Atom(name: '_AdminSymptomsStoreBase.showItemOptionsOf');

  @override
  int get showItemOptionsOf {
    _$showItemOptionsOfAtom.reportRead();
    return super.showItemOptionsOf;
  }

  @override
  set showItemOptionsOf(int value) {
    _$showItemOptionsOfAtom.reportWrite(value, super.showItemOptionsOf, () {
      super.showItemOptionsOf = value;
    });
  }

  final _$initStoreAsyncAction =
      AsyncAction('_AdminSymptomsStoreBase.initStore');

  @override
  Future initStore() {
    return _$initStoreAsyncAction.run(() => super.initStore());
  }

  final _$_AdminSymptomsStoreBaseActionController =
      ActionController(name: '_AdminSymptomsStoreBase');

  @override
  dynamic setCurrentSymptom(dynamic value) {
    final _$actionInfo = _$_AdminSymptomsStoreBaseActionController.startAction(
        name: '_AdminSymptomsStoreBase.setCurrentSymptom');
    try {
      return super.setCurrentSymptom(value);
    } finally {
      _$_AdminSymptomsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addSymptom() {
    final _$actionInfo = _$_AdminSymptomsStoreBaseActionController.startAction(
        name: '_AdminSymptomsStoreBase.addSymptom');
    try {
      return super.addSymptom();
    } finally {
      _$_AdminSymptomsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeSymptom(dynamic index) {
    final _$actionInfo = _$_AdminSymptomsStoreBaseActionController.startAction(
        name: '_AdminSymptomsStoreBase.removeSymptom');
    try {
      return super.removeSymptom(index);
    } finally {
      _$_AdminSymptomsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeAllCardOptions() {
    final _$actionInfo = _$_AdminSymptomsStoreBaseActionController.startAction(
        name: '_AdminSymptomsStoreBase.closeAllCardOptions');
    try {
      return super.closeAllCardOptions();
    } finally {
      _$_AdminSymptomsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSymptom: ${currentSymptom},
showItemOptionsOf: ${showItemOptionsOf}
    ''';
  }
}
