import 'package:mobx/mobx.dart';
import 'package:pandemicweb/models/cases.model.dart';

part 'admin_home_page.store.g.dart';

class AdminHomePageStore = _AdminHomePageStoreBase with _$AdminHomePageStore;

abstract class _AdminHomePageStoreBase with Store {
  _AdminHomePageStoreBase() {}
}
