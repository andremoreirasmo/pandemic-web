import 'package:flutter/material.dart';
import 'package:pandemic/utils/colors.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Function onTap;

  MenuItem({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            color: ColorsModel.textColor.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
