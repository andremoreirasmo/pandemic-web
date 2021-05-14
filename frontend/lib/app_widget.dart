import 'package:flutter/material.dart';
import 'package:pandemicweb/ui/pages/widgets/navigation_side_bar/navigation-sidebar.page.dart';
import 'package:pandemicweb/utils/colors.dart';

class AppWidget extends StatelessWidget {
  final child;

  const AppWidget({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: ColorsModel.primaryColorDark,
        child: Row(
          children: [
            NavigationSideBar(),
            Expanded(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
