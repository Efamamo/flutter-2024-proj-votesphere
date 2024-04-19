import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField({super.key, required this.controller, required this.hintText});
  String hintText;
  TextEditingController controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true, // Enable filling the TextField background
          fillColor: Colors.grey[300],
          hintText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ));
  }
}
