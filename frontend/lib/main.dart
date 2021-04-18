import 'package:flutter/material.dart';
import 'package:pandemicweb/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandemic',
      home: HomePage(),
    );
  }
}
