import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/shared/utils/functions.dart';
part 'admin_symptoms.store.g.dart';

class AdminSymptomsStore = _AdminSymptomsStoreBase with _$AdminSymptomsStore;

abstract class _AdminSymptomsStoreBase with Store {
  _AdminSymptomsStoreBase() {
    initStore();
  }

  ObservableList<String> sintomas = ObservableList.of([]);

  @observable
  String currentSymptom = '';

  @observable
  int showItemOptionsOf = -1;

  @action
  initStore() async {}

  @action
  setCurrentSymptom(value) => currentSymptom = value;

  @action
  addSymptom() {
    if (currentSymptom != null && currentSymptom.isNotEmpty) {
      if (!sintomas.contains(currentSymptom)) {
        sintomas.add(currentSymptom);
        Functions.showCustomFlushBar(
            'O sintoma $currentSymptom foi removido com sucesso',
            Colors.greenAccent[400]);
      }
    }
  }

  @action
  removeSymptom(index) {
    sintomas.removeAt(index);
    Functions.showCustomFlushBar(
        'O sintoma $currentSymptom foi removido com sucesso', Colors.red[400]);
    currentSymptom = '';
  }

  toggleOptionsItem(int index) {
    if (index == showItemOptionsOf) {
      closeAllCardOptions();
    } else {
      showItemOptionsOf = index;
    }
  }

  @action
  closeAllCardOptions() {
    showItemOptionsOf = -1;
  }
}
