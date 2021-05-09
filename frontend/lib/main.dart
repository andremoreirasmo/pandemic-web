import 'package:flutter/material.dart';
import 'package:pandemicweb/ui/pages/navigation_side_bar/navigation-sidebar.page.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xFF202124),
        child: Row(
          children: [
            NavigationSideBar(),
          ],
        ),
      ),
    );
  }
}
