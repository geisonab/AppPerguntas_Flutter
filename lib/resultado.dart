import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(
      {Key? key, required this.pontuacaototal, required this.quandoreinciar})
      : super(key: key);
  final int pontuacaototal;
  final Function() quandoreinciar;

  String get fraseResultado {
    if (pontuacaototal < 8) {
      return 'Paranbens!';
    } else if (pontuacaototal < 12) {
      return 'Você é bom!';
    } else if (pontuacaototal < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: quandoreinciar,
              child: Text(
                'Reiniciar?',
                style: TextStyle(
                  fontSize: 20,
                  backgroundColor: Colors.cyan,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
