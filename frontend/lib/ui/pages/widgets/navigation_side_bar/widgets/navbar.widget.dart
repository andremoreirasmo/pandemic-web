import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:pandemicweb/ui/pages/widgets/navigation_side_bar/navigation-sidebar.store.dart';
import 'package:pandemicweb/ui/pages/widgets/navigation_side_bar/widgets/navbar-item.widget.dart';

class NavBar extends StatelessWidget {
  final store = NavigationSideBarStore();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        height: 350.0,
        child: Column(
          children: [
            NavBarItem(
                icon: FeatherIcons.home,
                active: store.selected[0],
                onTap: () {
                  store.select(0);
                  navKey.currentState.pushNamed(Routes.home);
                }),
            NavBarItem(
                icon: FeatherIcons.barChart2,
                active: store.selected[1],
                onTap: () {
                  store.select(1);
                  navKey.currentState.pushNamed(Routes.statistics);
                }),
            NavBarItem(
              icon: FeatherIcons.book,
              active: store.selected[2],
              onTap: () => store.select(2),
            ),
            NavBarItem(
              icon: FeatherIcons.lock,
              active: store.selected[3],
              onTap: () { 
                store.select(3);
                navKey.currentState.pushNamed(Routes.login_adm);
              }
            ),
          ],
        ),
      ),
    );
  }
}
