import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/core/models/symptom.model.dart';
import 'package:pandemicweb/core/repositories/api_repository.dart';
import 'package:pandemicweb/shared/utils/functions.dart';
part 'admin_symptoms.store.g.dart';

class AdminSymptomsStore = _AdminSymptomsStoreBase with _$AdminSymptomsStore;

abstract class _AdminSymptomsStoreBase with Store {
  final _apiRepository = ApiRepository();

  _AdminSymptomsStoreBase() {
    initStore();
  }

  ObservableList<SymptomModel> sintomas = ObservableList.of([]);

  @observable
  String currentSymptom = '';

  @observable
  int showItemOptionsOf = -1;

  @action
  initStore() async {
    getAllSymptoms();
  }

  @action
  setCurrentSymptom(value) => currentSymptom = value;

  @action
  getAllSymptoms() async {
    sintomas.addAll(await _apiRepository.getSymptoms());
  }

  @action
  addSymptom() async {
    if (currentSymptom != null && currentSymptom.isNotEmpty) {
      if (!sintomas.contains(currentSymptom)) {
        await _apiRepository.sendSymptom(currentSymptom).then((value) {
          if (value != null) {
            sintomas.add(value);
            Functions.showCustomFlushBar(
                'O sintoma $currentSymptom foi adicionado com sucesso',
                Colors.greenAccent[400]);
          } else {
            Functions.showCustomFlushBar('Algum erro ocorreu', Colors.red[400]);
          }
        });
      }
    }
  }

  @action
  removeSymptom({index, id}) async {
    await _apiRepository.removeSymptom(id).then((value) {
      if (value) {
        sintomas.removeAt(index);
        Functions.showCustomFlushBar(
            'O sintoma $currentSymptom foi removido com sucesso',
            Colors.greenAccent);
        currentSymptom = '';
      } else {
        Functions.showCustomFlushBar('Algum erro ocorreu', Colors.red[400]);
      }
    });
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
