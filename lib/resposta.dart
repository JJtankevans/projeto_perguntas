import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta({required this.onPressd, this.respostaTexto = "", super.key});

  final String respostaTexto;
  final VoidCallback onPressd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: onPressd,
        child: Text(
          respostaTexto,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
