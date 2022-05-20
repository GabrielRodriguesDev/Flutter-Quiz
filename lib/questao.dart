// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';

class Questao extends StatelessWidget {
  Questao({Key? key, required this.texto}) : super(key: key);
  String? texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        texto as String,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
