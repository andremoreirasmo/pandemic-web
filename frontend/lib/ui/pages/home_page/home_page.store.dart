import 'package:mobx/mobx.dart';
import 'package:pandemicweb/models/cases.model.dart';
import 'package:pandemicweb/repositories/covid_repository.dart';
part 'home_page.store.g.dart';

class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  CovidRepository _covidRepository = CovidRepository();

  _HomePageStoreBase() {
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
