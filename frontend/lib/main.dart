import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pandemicweb/app_widget.dart';
import 'package:pandemicweb/routes/router_generator.dart';
import 'package:pandemicweb/routes/routes_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandemic',
      builder: (_, child) {
        child = botToastBuilder(context, child);
        return AppWidget(child: child);
      },
      initialRoute: Routes.home,
      navigatorKey: navKey,
      navigatorObservers: [BotToastNavigatorObserver()],
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
