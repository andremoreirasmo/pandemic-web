import 'package:flutter/material.dart';
import 'package:pandemicweb/shared/utils/colors.dart';
import 'package:pandemicweb/ui/components/navigation_side_bar/widgets/navbar.widget.dart';

class NavigationSideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 60.0,
        color: ColorsModel.primaryBlueColor,
        child: Stack(
          children: [
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