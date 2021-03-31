import 'package:flutter/material.dart';
import 'package:pandemic/widgets/menu_item.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(46),
      ),
      child: Row(
        children: [
          Text(
            "Monitoramento de casos COVID-19",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Spacer(),
          MenuItem(
            title: 'Orientações',
          ),
          MenuItem(
            title: 'Dashboard',
          ),
          MenuItem(
            title: 'Teste Online',
          ),
          MenuItem(
            title: 'Área restrita',
          ),
          Image.network(
            'https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Face-Profile-User-Man-Boy-Person-Avatar-512.png',
            // height: 30,
            scale: 10,
          )
        ],
      ),
    );
  }
}
