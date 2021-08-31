import 'package:flutter/material.dart';
import 'package:treinamento_cod3r/questionario.dart';
import 'resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaselecionada = 0;
  int _pontuacaototal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'resposta': [
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Passarinho', 'pontuacao': 3},
        {'texto': 'Jibóia', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é seu instrutor favorito?',
      'resposta': [
        {'texto': 'Eu', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Pedro', 'pontuacao': 3},
        {'texto': 'Jibóia', 'pontuacao': 1},
      ],
    }
  ];

  bool get temperguntaSelecionada {
    return _perguntaselecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temperguntaSelecionada) {
      setState(() {
        _pontuacaototal += pontuacao;
        _perguntaselecionada++;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaselecionada = 0;
      _pontuacaototal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgets = respostas
    //     .map<Widget>((t) => Resposta(texto: t, quandoSelecionado: _responder))
    //     .toList();

    // for (var textoresp in respostas) {
    //   widgets.add(
    //     Resposta(
    //       texto: textoresp,
    //       quandoSelecionado: _responder,
    //     ),
    //   );
    // }

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temperguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                quandoresponder: _responder,
                perguntaselecionada: _perguntaselecionada,
              )
            : Resultado(
                pontuacaototal: _pontuacaototal,
                quandoreinciar: _reiniciar,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
