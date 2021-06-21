import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final TextInputType kType;
  final Function onChanged;
  final Color hintColor;
  final TextEditingController controller;

  CustomTextField(
      {Key key,
      this.hintText,
      this.initialValue,
      this.kType,
      this.onChanged,
      this.controller,
      this.hintColor = Colors.grey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: null,
        keyboardType: kType,
        controller: controller,
        cursorHeight: 20,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 18,
          // fontWeight: FontWeight.bold,
        ),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          hintText: hintText,
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 18,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
