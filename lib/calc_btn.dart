import 'package:flutter/material.dart';

class CalcBtn extends StatelessWidget {
  String text;
  void Function(String char) cb;

  CalcBtn({super.key, required this.text, required this.cb});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Text(text),
        onTap: () => cb(text),
      ),
    );
  }
}
