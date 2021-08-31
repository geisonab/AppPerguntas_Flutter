import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  Questionario({
    Key? key,
    required this.perguntas,
    required this.perguntaselecionada,
    required this.quandoresponder,
  }) : super(key: key);

  final List<Map<String, Object>> perguntas;
  final int perguntaselecionada;
  final void Function(int) quandoresponder;

  bool get temperguntaSelecionada {
    return perguntaselecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temperguntaSelecionada
        ? perguntas[perguntaselecionada].cast()['resposta']
        : [];

    return Container(
      child: Column(
        children: [
          Questao(
            perguntas[perguntaselecionada]['texto'].toString(),
          ),
          ...respostas.map<Widget>(
            (resp) {
              return Resposta(
                texto: resp['texto'].toString(),
                quandoSelecionado: () =>
                    quandoresponder(int.parse(resp['pontuacao'].toString())),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
