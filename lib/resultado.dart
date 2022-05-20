// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';

class Resultado extends StatelessWidget {
  const Resultado({Key? key, required this.pontuacao, required this.press})
      : super(key: key);

  final int pontuacao;
  final void Function() press;

  String get textoResultado {
    if (pontuacao < 10) {
      return 'Wook';
    } else if (pontuacao < 16) {
      return 'Droid';
    } else if (pontuacao < 20) {
      return 'Padawan';
    } else {
      return 'Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            textoResultado,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          SizedBox(
            height: 20,
          ),
          Resposta(
            texto: 'Reiniciar', //Comunição indireta -> Do filho para o Pai
            press: press,
          )
        ],
      ),
    );
  }
}
