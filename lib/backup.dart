/* // ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

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
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': ['Guepardo', 'Gorila', 'Baleia', 'Suricato']
    },
    {
      'texto': 'Qual é o seu alimento favorito?',
      'resposta': ['Frango', 'Carne', 'Peixe', 'Embutidos']
    }
  ];
  var _perguntaSelecionada = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print(temPerguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['resposta']
        : [];

    // for (String textResp in respostas) {
    //   widgets.add(Resposta(
    //     texto: textResp,
    //     press: _responder,
    //   ));
    // }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: temPerguntaSelecionada
                ? Column(
                    children: [
                      Questao(
                          texto: _perguntas[_perguntaSelecionada]['texto']
                              .toString()),
                      ...respostas
                          .map((t) => Resposta(texto: t, press: _responder))
                          .toList() // Operador de propagação (...) que nesse caso de uso está servindo para
                      // eu propagar os elementos de uma lista na árvore de Widget.
                      // Nesse caso de uso estamos propagando na árvore alguns Widgets, com base no map()
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Não tem mais perguntas disponíveis!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 26),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Resposta(
                            texto: "Parabéns!",
                            press: () {
                              setState(() {
                                _perguntaSelecionada = 0;
                              });
                            })
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
*/