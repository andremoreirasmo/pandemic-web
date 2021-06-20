import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String statistics = '/statistics';
  static const String login = '/login';
  static const String admin_home = '/admin';
  static const String admin_orientation = '/admin/orientation';
  static const String admin_report = '/admin/report';
  static const String admin_user = '/admin/user';
  static const String edit_orientation = '/admin/orientation/edit';
  static const String new_orientation = '/admin/orientation/new';

}

final navKey = new GlobalKey<NavigatorState>();
