import 'package:flutter/material.dart';

class NotFoundMessage extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final Color color;
  final String message;
  final IconData icon;
  final double fontSize;

  NotFoundMessage(
      {this.height = 0,
      this.backgroundColor = Colors.transparent,
      this.message = 'Nada a ser mostrado aqui',
      this.icon = Icons.search_off,
      this.color = Colors.black54,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: height > 0 ? height : null,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: fontSize * 2.5,
            color: color,
          ),
          SelectableText(
            message,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: color,
            ),
          ),
        ],
      )),
    );
  }
}
