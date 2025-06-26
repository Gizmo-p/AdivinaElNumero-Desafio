import 'package:flutter/material.dart';
import 'package:guess_the_number_fluttter/models/game_state.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/column.dart';

class ColumnsSection extends StatelessWidget {
  const ColumnsSection({super.key, required this.gameState});

  final GameState gameState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 100,
          height: 250,
          child: GameColumn(
            title: 'Mayor que',
            numbers: gameState.higherNumbers.map((n) => n.toString()).toList(),
          ),
        ),
        SizedBox(
          width: 100,
          height: 250,
          child: GameColumn(
            title: 'Menor que',
            numbers: gameState.lowerNumbers.map((n) => n.toString()).toList(),
          ),
        ),
        SizedBox(
          width: 100,
          height: 250,
          child: GameColumn(
            title: 'Historial',
            numbers:
                gameState.historialNumbers.map((n) => n.toString()).toList(),
            numbersStatus: gameState.historialNumbersStatus,
            showColors: true,
          ),
        ),
      ],
    );
  }
}
