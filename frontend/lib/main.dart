import 'package:flutter/material.dart';
import 'package:pandemicweb/app_widget.dart';
import 'package:pandemicweb/routes/router_generator.dart';
import 'package:pandemicweb/routes/routes_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandemic',
      builder: (_, child) => AppWidget(
        child: child,
      ),
      initialRoute: Routes.new_orientation,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
