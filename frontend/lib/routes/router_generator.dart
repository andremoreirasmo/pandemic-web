import 'package:flutter/material.dart';
import 'package:pandemicweb/routes/routes_model.dart';
import 'package:pandemicweb/ui/pages/admin/home/admin_home_page.dart';
import 'package:pandemicweb/ui/pages/admin/login_page/login_page.dart';
import 'package:pandemicweb/ui/pages/admin/orientation/admin_orientation_page.dart';
import 'package:pandemicweb/ui/pages/admin/report/admin_report_page.dart';
import 'package:pandemicweb/ui/pages/admin/user/admin_user_page.dart';
import 'package:pandemicweb/ui/pages/home_page/home_page.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomePage());
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

    }
  }
}
