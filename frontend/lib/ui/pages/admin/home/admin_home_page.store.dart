import 'package:mobx/mobx.dart';
import 'package:pandemicweb/models/cases.model.dart';
import 'package:pandemicweb/repositories/covid_repository.dart';
part 'admin_home_page.store.g.dart';

class AdminHomePageStore = _AdminHomePageStoreBase with _$AdminHomePageStore;

abstract class _AdminHomePageStoreBase with Store {
  CovidRepository _covidRepository = CovidRepository();

  _AdminHomePageStoreBase() {
    initStore();
  }

  @observable
  WorldCases worldCases;

  @action
  initStore() {
    fetchAllData();
  }

  @action
  fetchAllData() async {
    worldCases = await _covidRepository.fetchWorldCases();
  }
}
