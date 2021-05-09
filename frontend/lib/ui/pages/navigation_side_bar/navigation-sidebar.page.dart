import 'package:flutter/material.dart';
import 'package:pandemicweb/ui/pages/navigation_side_bar/widgets/navbar.widget.dart';

class NavigationSideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 60.0,
        color: Color(0xff333951),
        child: Stack(
          children: [
            // TopLogo(),
            Align(
              alignment: Alignment.center,
              child: NavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
