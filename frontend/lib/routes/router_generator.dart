import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/ui/features/admin_page/home/admin_home_page.dart';
import 'package:pandemicweb/ui/features/admin_page/login_page/login_page.dart';
import 'package:pandemicweb/ui/features/admin_page/orientation/admin_orientation_page.dart';
import 'package:pandemicweb/ui/features/admin_page/orientation/pages/edit_orientation_page.dart';
import 'package:pandemicweb/ui/features/admin_page/orientation/pages/new_orientation_page.dart';
import 'package:pandemicweb/ui/features/admin_page/report/admin_report_page.dart';
import 'package:pandemicweb/ui/features/admin_page/symptoms/admin_symptoms_page.dart';
import 'package:pandemicweb/ui/features/admin_page/user/admin_user_page.dart';
import 'package:pandemicweb/ui/features/home_page/home_page.dart';
import 'package:pandemicweb/ui/features/statistics_page/statistics_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case Routes.statistics:
        return MaterialPageRoute(builder: (_) => StatisticsPage());
        break;
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case Routes.admin_home:
        return MaterialPageRoute(builder: (_) => AdminHomePage());
        break;
      case Routes.admin_orientation:
        return MaterialPageRoute(builder: (_) => AdminOrientationPage());
        break;
      case Routes.admin_report:
        return MaterialPageRoute(builder: (_) => AdminReportPage());
        break;
      case Routes.admin_user:
        return MaterialPageRoute(builder: (_) => AdminUserPage());
        break;
      case Routes.admin_symptoms:
        return MaterialPageRoute(builder: (_) => AdminSymptomsPage());
        break;
      case Routes.edit_orientation:
        return MaterialPageRoute(builder: (_) => EditOrientationPage());
        break;
      case Routes.new_orientation:
        return MaterialPageRoute(builder: (_) => NewOrientationPage());
        break;
    }
  }
}
