// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_orientation_page.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminOrientationPageStore on _AdminOrientationPageStoreBase, Store {
  final _$imageAtom = Atom(name: '_AdminOrientationPageStoreBase.image');

  @override
  PickedFile get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(PickedFile value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$isBtnCreateLoadingAtom =
      Atom(name: '_AdminOrientationPageStoreBase.isBtnCreateLoading');

  @override
  bool get isBtnCreateLoading {
    _$isBtnCreateLoadingAtom.reportRead();
    return super.isBtnCreateLoading;
  }

  @override
  set isBtnCreateLoading(bool value) {
    _$isBtnCreateLoadingAtom.reportWrite(value, super.isBtnCreateLoading, () {
      super.isBtnCreateLoading = value;
    });
  }

  final _$isFetchLoadingAtom =
      Atom(name: '_AdminOrientationPageStoreBase.isFetchLoading');

  @override
  bool get isFetchLoading {
    _$isFetchLoadingAtom.reportRead();
    return super.isFetchLoading;
  }

  @override
  set isFetchLoading(bool value) {
    _$isFetchLoadingAtom.reportWrite(value, super.isFetchLoading, () {
      super.isFetchLoading = value;
    });
  }

  final _$titleAtom = Atom(name: '_AdminOrientationPageStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_AdminOrientationPageStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$createResponseMessageAtom =
      Atom(name: '_AdminOrientationPageStoreBase.createResponseMessage');

  @override
  String get createResponseMessage {
    _$createResponseMessageAtom.reportRead();
    return super.createResponseMessage;
  }

  @override
  set createResponseMessage(String value) {
    _$createResponseMessageAtom.reportWrite(value, super.createResponseMessage,
        () {
      super.createResponseMessage = value;
    });
  }

  final _$errorAtom = Atom(name: '_AdminOrientationPageStoreBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$orientationsAtom =
      Atom(name: '_AdminOrientationPageStoreBase.orientations');

  @override
  List<Orientation> get orientations {
    _$orientationsAtom.reportRead();
    return super.orientations;
  }

  @override
  set orientations(List<Orientation> value) {
    _$orientationsAtom.reportWrite(value, super.orientations, () {
      super.orientations = value;
    });
  }

  final _$fetchAsyncAction =
      AsyncAction('_AdminOrientationPageStoreBase.fetch');

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$createAsyncAction =
      AsyncAction('_AdminOrientationPageStoreBase.create');

  @override
  Future create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$_AdminOrientationPageStoreBaseActionController =
      ActionController(name: '_AdminOrientationPageStoreBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_AdminOrientationPageStoreBaseActionController
        .startAction(name: '_AdminOrientationPageStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_AdminOrientationPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AdminOrientationPageStoreBaseActionController
        .startAction(name: '_AdminOrientationPageStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_AdminOrientationPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initStore() {
    final _$actionInfo = _$_AdminOrientationPageStoreBaseActionController
        .startAction(name: '_AdminOrientationPageStoreBase.initStore');
    try {
      return super.initStore();
    } finally {
      _$_AdminOrientationPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(dynamic id) {
    final _$actionInfo = _$_AdminOrientationPageStoreBaseActionController
        .startAction(name: '_AdminOrientationPageStoreBase.delete');
    try {
      return super.delete(id);
    } finally {
      _$_AdminOrientationPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
isBtnCreateLoading: ${isBtnCreateLoading},
isFetchLoading: ${isFetchLoading},
title: ${title},
description: ${description},
createResponseMessage: ${createResponseMessage},
error: ${error},
orientations: ${orientations}
    ''';
  }
}
