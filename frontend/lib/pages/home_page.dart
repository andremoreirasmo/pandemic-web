import 'package:flutter/material.dart';
import 'package:pandemic/components/body.component.dart';
import 'package:pandemic/components/custom_nav_bar.dart';
import 'package:pandemic/utils/colors.dart';

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
