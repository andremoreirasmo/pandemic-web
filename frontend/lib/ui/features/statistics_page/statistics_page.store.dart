import 'package:mobx/mobx.dart';
import 'package:pandemicweb/core/models/brazil_cases.model.dart';
import 'package:pandemicweb/core/models/cases.model.dart';
import 'package:pandemicweb/core/repositories/covid_repository.dart';
part 'statistics_page.store.g.dart';

class StatisticsPageStore = _StatisticsPageStoreBase with _$StatisticsPageStore;

abstract class _StatisticsPageStoreBase with Store {
  CovidRepository _covidRepository = CovidRepository();

  _StatisticsPageStoreBase() {
    initStore();
  }

  @observable
  WorldCases worldCases;

  @observable
  List<BrazilCases> brazilCases;

  @observable
  List<int> lastMonths = [];

  @action
  initStore() {
    fetchAllData();
    getBrazilCasesData();
    lastMonths = getLastThreeMonths();
  }

  @action
  fetchAllData() async {
    worldCases = await _covidRepository.fetchWorldCases();
  }

  @action
  getBrazilCasesData() async {
    brazilCases = await _covidRepository.fetchBrazilCases();
    getLastThreeMonths();
  }

  List<int> getLastThreeMonths() {
    List<int> months = [];

    DateTime threeMonthsAgo = DateTime.now().subtract(Duration(days: 80));
    DateTime oneMonthsAgo = DateTime.now().subtract(Duration(days: 28));

    int monthOne = threeMonthsAgo.month;
    months.add(monthOne);
    int monthTwo = oneMonthsAgo.month;
    months.add(monthTwo);
    int monthThree = DateTime.now().month;
    months.add(monthThree);

    return months;
  }
}
