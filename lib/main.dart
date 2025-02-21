import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": 10},
        {"texto": "Vermelho", "pontuacao": 5},
        {"texto": "Verde", "pontuacao": 3},
        {"texto": "Branco", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Cobra", "pontuacao": 5},
        {"texto": "Elefante", "pontuacao": 3},
        {"texto": "Leão", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é jogo favorito?",
      "respostas": [
        {"texto": "League of Legends", "pontuacao": 10},
        {"texto": "Valorant", "pontuacao": 5},
        {"texto": "Counter-Strike", "pontuacao": 3},
        {"texto": "Dota 2", "pontuacao": 1},
      ],
    },
  ];

  /* É um getter que devolve se a o indice _perguntaSeleciona é 
  menor que o tamanho da lista */
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _restartQuestionnaire() {
    setState(() {
      _perguntaSelecionada = 0; 
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Perguntas")),
        body:
            temPerguntaSelecionada
                ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  quantoResponder: _responder,
                )
                : Resultado(
                  resultText: "Parabéns!!",
                  pontuacao: _pontuacaoTotal,
                  onPressdRestartQuestionnaire: _restartQuestionnaire,
                ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
  
}
