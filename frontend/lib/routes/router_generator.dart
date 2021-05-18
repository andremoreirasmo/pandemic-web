import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/ui/pages/admin/login_page.dart';
import 'package:pandemicweb/ui/pages/home_page/home_page.dart';
import 'package:pandemicweb/ui/pages/statistics_page/statistics_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case Routes.statistics:
        return MaterialPageRoute(builder: (_) => StatisticsPage());
        break;
      case Routes.login_adm:
        return MaterialPageRoute(builder: (_) => LoginAdmPage());
        break;
    }
  }
}
