import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.quantoResponder,
    super.key,
  });

  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quantoResponder;

  /* É um getter que devolve se a o indice _perguntaSeleciona é 
  menor que o tamanho da lista */
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //Verifica se a pergunta atual a ser selecionada é menor que o tamanho da lista de perguntas
    //se for pega a lista de opcoes de respostas para a pergunta atual
    List<Map<String, Object>> respostas =
        temPerguntaSelecionada
            ? perguntas[perguntaSelecionada]["respostas"]
                as List<Map<String, Object>>
            : [];

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]["texto"].toString()),
        /* Concatena utilizando o spread operator a lista de opcoes de respostas 
                    aos filhos do Column, em seguida converte as respostas atrasves do map
                    para uma lista de widgets do que são do componente Resposta */
        ...respostas.map(
          (resp) => Resposta(
            respostaTexto: resp["texto"] as String,
            onPressd: () => quantoResponder(resp["pontuacao"] as int),
          ),
        ),
      ],
    );
  }
}
