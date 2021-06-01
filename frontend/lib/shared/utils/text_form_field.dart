import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pandemicweb/shared/utils/app_text_styles.dart';
import 'package:pandemicweb/shared/utils/colors.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Function validator;
  final Function onSaved;
  final bool password;
  final TextEditingController controller;
  
  AppTextField(this.label, this.hint,
      {this.validator, this.onSaved, this.password = false,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      validator: this.validator,
      onSaved: this.onSaved,
      obscureText: password,

      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.grey[300],
        fontSize: 14,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          labelText: this.label,
          labelStyle: TextStyle(
              color: Colors.grey[300], fontSize: 16),
          hintText: this.hint,
          hintStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: 14,
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.white,width: 3)
          ),
          errorStyle: TextStyle(fontSize: 14)),
    );
  }
}