import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() reniciarQuestionario;

  Resultado(this.pontuacao, this.reniciarQuestionario);

  String get fraseResultado {
    if(pontuacao < 8) {
      return 'Parabéns!';
    }  
    else if(pontuacao < 12) {
      return 'Você é bom!';
    }
    else if(pontuacao < 16) {
      return 'Impressionante!';
    }
    else return 'Nível Jedi!';

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(fraseResultado,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          )
        ),
        FlatButton(
          child: Text('Reniciar?',
            style: TextStyle(fontSize: 18),
          ),
          color: Colors.blue,
          onPressed: reniciarQuestionario,
        )
      ],
    );
  }
}