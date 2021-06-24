import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandemicweb/core/models/symptom.model.dart';
import 'package:pandemicweb/core/repositories/api_repository.dart';
import 'package:smart_select/smart_select.dart';
part 'covid_test_page.store.g.dart';

class CovidTestPageStore = _CovidTestPageStoreBase with _$CovidTestPageStore;

abstract class _CovidTestPageStoreBase with Store {
  ApiRepository _apiRepository = ApiRepository();

  _CovidTestPageStoreBase() {
    initStore();
  }

  ObservableList<S2Choice<SymptomModel>> sintomas = ObservableList.of([]);
  @observable
  List<SymptomModel> selectedSymptoms = [];

  @observable
  int selectedSymptomsLength = 0;
  // ObservableMap<String, dynamic> diagnostico = ObservableMap.of(
  // {"title": "Não diagnosticado", "color": Colors.grey[400]});
  // List<S2Choice<String>> options = [
  //       S2Choice<String>(value: 'ion', title: 'Ionic'),
  //       S2Choice<String>(value: 'flu', title: 'Flutter'),
  //       S2Choice<String>(value: 'rea', title: 'React Native'),
  //     ];

  @observable
  String diagnostico = 'Não diagnosticado';

  @observable
  Color textColorDiagnostico = Colors.grey;

  @action
  initStore() {
    getAllSymptoms();
  }

  @action
  setSymptomsSelected(values) {
    selectedSymptomsLength = values.length;
    // selectedSymptoms = [];
    // selectedSymptoms.addAll(values);
    getDiagnostico();
  }

  @action
  getDiagnostico() {
    print("$selectedSymptomsLength LENGTH ATT");
    if (selectedSymptomsLength >= 7) {
      // diagnostico = ObservableMap.of({
      //   "title": "Você tem COVID",
      //   "color": Colors.red[400],
      // });
      diagnostico = "Você tem COVID";
      textColorDiagnostico = Colors.redAccent;
    } else {
      if (selectedSymptomsLength >= 0 && selectedSymptomsLength <= 3) {
        // diagnostico = ObservableMap.of({
        //   "title": "Suspeita Baixa",
        //   "color": Colors.yellow[400],
        // });
        diagnostico = "Suspeita Baixa";
        textColorDiagnostico = Colors.yellow[600];
      }
      if (selectedSymptomsLength > 3 && selectedSymptomsLength <= 5) {
        // diagnostico = ObservableMap.of({
        //   "title": "Suspeita Média",
        //   "color": Colors.amber[400],
        // });
        diagnostico = "Suspeita Média";
        textColorDiagnostico = Colors.amber[600];
      }
      if (selectedSymptomsLength > 5 && selectedSymptomsLength < 8) {
        // diagnostico = ObservableMap.of({
        //   "title": "Suspeita Alta",
        //   "color": Colors.red[300],
        // });
        diagnostico = "Suspeita Alta";
        textColorDiagnostico = Colors.red[400];
      }
    }
    print(diagnostico.toString());
  }

  @action
  getAllSymptoms() async {
    List<SymptomModel> result = await _apiRepository.getSymptoms();
    result.forEach((r) => sintomas.add(S2Choice(value: r, title: r.desSym)));
    // sintomas.addAll(await _apiRepository.getSymptoms());
  }
}
