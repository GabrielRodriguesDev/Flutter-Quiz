// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_element, avoid_print, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  final List<Map<String, dynamic>> _perguntas = [
    const {
      'texto': 'Qual é a sua cor favorita',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 7},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto': 'Guepardo', 'pontuacao': 6},
        {'texto': 'Gorila', 'pontuacao': 8},
        {'texto': 'Baleia', 'pontuacao': 1},
        {'texto': 'Suricato', 'pontuacao': 3},
      ]
    },
    {
      'texto': 'Qual é o seu alimento favorito?',
      'resposta': [
        {'texto': 'Frango', 'pontuacao': 1},
        {'texto': 'Carne', 'pontuacao': 2},
        {'texto': 'Peixe', 'pontuacao': 4},
        {'texto': 'Embutidos', 'pontuacao': 8},
      ]
    }
  ];

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responderQuestionario(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _resetarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    press: _responderQuestionario,
                  )
                : Resultado(
                    pontuacao: _pontuacaoTotal,
                    press: _resetarQuestionario,
                  ),
          ),
        ),
      ),
    );
  }
}
