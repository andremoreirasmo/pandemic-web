import 'package:mobx/mobx.dart';
part 'navigation-sidebar.store.g.dart';

class NavigationSideBarStore = _NavigationSideBarStoreBase
    with _$NavigationSideBarStore;

abstract class _NavigationSideBarStoreBase with Store {
  ObservableList<bool> selected =
      ObservableList.of([true, false, false, false, false]);

  @action
  select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }
}
