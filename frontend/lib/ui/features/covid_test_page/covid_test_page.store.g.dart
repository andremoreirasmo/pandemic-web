// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_test_page.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CovidTestPageStore on _CovidTestPageStoreBase, Store {
  final _$selectedSymptomsAtom =
      Atom(name: '_CovidTestPageStoreBase.selectedSymptoms');

  @override
  List<SymptomModel> get selectedSymptoms {
    _$selectedSymptomsAtom.reportRead();
    return super.selectedSymptoms;
  }

  @override
  set selectedSymptoms(List<SymptomModel> value) {
    _$selectedSymptomsAtom.reportWrite(value, super.selectedSymptoms, () {
      super.selectedSymptoms = value;
    });
  }

  final _$selectedSymptomsLengthAtom =
      Atom(name: '_CovidTestPageStoreBase.selectedSymptomsLength');

  @override
  int get selectedSymptomsLength {
    _$selectedSymptomsLengthAtom.reportRead();
    return super.selectedSymptomsLength;
  }

  @override
  set selectedSymptomsLength(int value) {
    _$selectedSymptomsLengthAtom
        .reportWrite(value, super.selectedSymptomsLength, () {
      super.selectedSymptomsLength = value;
    });
  }

  final _$diagnosticoAtom = Atom(name: '_CovidTestPageStoreBase.diagnostico');

  @override
  String get diagnostico {
    _$diagnosticoAtom.reportRead();
    return super.diagnostico;
  }

  @override
  set diagnostico(String value) {
    _$diagnosticoAtom.reportWrite(value, super.diagnostico, () {
      super.diagnostico = value;
    });
  }

  final _$textColorDiagnosticoAtom =
      Atom(name: '_CovidTestPageStoreBase.textColorDiagnostico');

  @override
  Color get textColorDiagnostico {
    _$textColorDiagnosticoAtom.reportRead();
    return super.textColorDiagnostico;
  }

  @override
  set textColorDiagnostico(Color value) {
    _$textColorDiagnosticoAtom.reportWrite(value, super.textColorDiagnostico,
        () {
      super.textColorDiagnostico = value;
    });
  }

  final _$getAllSymptomsAsyncAction =
      AsyncAction('_CovidTestPageStoreBase.getAllSymptoms');

  @override
  Future getAllSymptoms() {
    return _$getAllSymptomsAsyncAction.run(() => super.getAllSymptoms());
  }

  final _$_CovidTestPageStoreBaseActionController =
      ActionController(name: '_CovidTestPageStoreBase');

  @override
  dynamic initStore() {
    final _$actionInfo = _$_CovidTestPageStoreBaseActionController.startAction(
        name: '_CovidTestPageStoreBase.initStore');
    try {
      return super.initStore();
    } finally {
      _$_CovidTestPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSymptomsSelected(dynamic values) {
    final _$actionInfo = _$_CovidTestPageStoreBaseActionController.startAction(
        name: '_CovidTestPageStoreBase.setSymptomsSelected');
    try {
      return super.setSymptomsSelected(values);
    } finally {
      _$_CovidTestPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDiagnostico() {
    final _$actionInfo = _$_CovidTestPageStoreBaseActionController.startAction(
        name: '_CovidTestPageStoreBase.getDiagnostico');
    try {
      return super.getDiagnostico();
    } finally {
      _$_CovidTestPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSymptoms: ${selectedSymptoms},
selectedSymptomsLength: ${selectedSymptomsLength},
diagnostico: ${diagnostico},
textColorDiagnostico: ${textColorDiagnostico}
    ''';
  }
}
