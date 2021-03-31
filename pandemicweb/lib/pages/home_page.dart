import 'package:flutter/material.dart';
import 'package:pandemicweb/components/body.component.dart';
import 'package:pandemicweb/components/custom_nav_bar.dart';
import 'package:pandemicweb/utils/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsModel.secundaryColor,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNavBar(),
            Body(),
          ],
        ),
      ),
    );
  }
}
