import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  Function onPressed;
  String text;

  AppButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
