import 'package:flutter/material.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final double radius;
  final bool showProgress;
  final Color color;
  final TextStyle style;

  AppButton(
      {this.text,
      this.callback,
      this.showProgress = false,
      this.color = Colors.deepPurple,
      this.style,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: 300,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: FlatButton(
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              )
            : Text(
                text,
                style: style != null ? style : AppTextStyles.description,
              ),
        onPressed: callback,
      ),
    );
  }
}
