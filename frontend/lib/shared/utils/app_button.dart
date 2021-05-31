import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  final bool showProgress;
  final Color color;
  final Color textcolor;

  AppButton(this.text, this.callback, {this.showProgress = false,this.color = Colors.deepPurple, this.textcolor = Colors.black});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(6),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color
      ),
      child: FlatButton(
        child: showProgress
            ? Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(textcolor),
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: textcolor,
          ),
        ),
        onPressed: callback ,
      ),
    );
  }
}