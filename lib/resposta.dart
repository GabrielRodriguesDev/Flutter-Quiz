// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  Resposta({Key? key, required this.texto, required this.press})
      : super(key: key);

  String? texto;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: TextButton(
        onPressed: press,
        child: Text(
          texto as String,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
