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

  final _$isLoadingAtom =
      Atom(name: '_AdminOrientationPageStoreBase.isLoading');

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

  final _$createAsyncAction =
      AsyncAction('_AdminOrientationPageStoreBase.create');

  @override
  Future create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$pickImageAsyncAction =
      AsyncAction('_AdminOrientationPageStoreBase.pickImage');

  @override
  Future pickImage() {
    return _$pickImageAsyncAction.run(() => super.pickImage());
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
  String toString() {
    return '''
image: ${image},
isLoading: ${isLoading},
title: ${title},
description: ${description}
    ''';
  }
}
