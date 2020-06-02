import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _pontuacaoTotal = 0;
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
       {'texto': 'Leo', 'pontuacao': 10} ,
       {'texto': 'Maria', 'pontuacao': 5},
       {'texto': 'João', 'pontuacao': 3},
       {'texto': 'Pedro', 'pontuacao': 1} ,
      ]
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get _temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: _temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                responder: _responder,
                perguntaSelecionada: _perguntaSelecionada,
              )
            : Resultado(_pontuacaoTotal, _reniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
