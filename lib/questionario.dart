import 'package:flutter/cupertino.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  Questionario(
      {Key? key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.press})
      : super(key: key);

  final List<Map<String, dynamic>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) press;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['resposta']
        : [];
    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map(
              (resp) => Resposta(
                texto: resp['texto'],
                //Passando uma função com retorno void que executa outra função.
                press: () => press(resp['pontuacao']),
              ),
            )
            .toList() // Operador de propagação (...) que nesse caso de uso está servindo para
        // eu propagar os elementos de uma lista na árvore de Widget.
        // Nesse caso de uso estamos propagando na árvore alguns Widgets, com base no map()
      ],
    );
  }
}
