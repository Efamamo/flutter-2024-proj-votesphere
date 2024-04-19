import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {super.key,
      required this.controller,
      required this.lines,
      required this.hintText});
  String hintText;
  int lines;
  TextEditingController controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: widget.lines,
        controller: widget.controller,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          hintText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ));
  }
}
