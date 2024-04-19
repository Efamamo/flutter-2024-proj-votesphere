import 'package:flutter/material.dart';
import '../screens/new_polls.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.child, required this.onTapped});
  final Widget child;
  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTapped,
        child: child,
        style: ElevatedButton.styleFrom(shape: const CircleBorder()));
  }
}
