import 'package:flutter/material.dart';
import 'package:pandemic/widgets/dashboard_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              DashboardCard(),
              DashboardCard(),
            ],
          ),
          Row(
            children: [
              DashboardCard(),
              DashboardCard(),
            ],
          ),
          Row(
            children: [
              DashboardCard(),
              DashboardCard(),
            ],
          ),
        ],
      ),
    );
  }
}
