import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
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
  addSymptom(context) {
    if (currentSymptom != null && currentSymptom.isNotEmpty) {
      if (!sintomas.contains(currentSymptom)) {
        sintomas.add(currentSymptom);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(
              'O sintoma $currentSymptom foi adicionado com sucesso',
              style: AppTextStyles.subtitle,
            )));
      }
    }
  }

  @action
  removeSymptom({context, index}) {
    sintomas.removeAt(index);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red[400],
        content: Text(
          'O sintoma $currentSymptom foi removido com sucesso',
          style: AppTextStyles.subtitle,
        )));
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
