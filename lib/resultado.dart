import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({
    this.resultText = "",
    required this.pontuacao,
    required this.onPressdRestartQuestionnaire,
    super.key,
  });

  final String resultText;
  final int pontuacao;
  final VoidCallback onPressdRestartQuestionnaire;

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns";
    } else if (pontuacao < 12) {
      return "Você é bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Nivel Jedi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: TextStyle(fontSize: 28))),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: onPressdRestartQuestionnaire,
          child: Text(
            "Refazer questionário",
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
