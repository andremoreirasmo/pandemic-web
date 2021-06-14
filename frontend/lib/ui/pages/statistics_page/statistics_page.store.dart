import 'package:mobx/mobx.dart';

import '../../../models/cases.model.dart';
import '../../../repositories/covid_repository.dart';
part 'statistics_page.store.g.dart';

class StatisticsPageStore = _StatisticsPageStoreBase with _$StatisticsPageStore;

abstract class _StatisticsPageStoreBase with Store {
  CovidRepository _covidRepository = CovidRepository();

  _StatisticsPageStoreBase() {
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
