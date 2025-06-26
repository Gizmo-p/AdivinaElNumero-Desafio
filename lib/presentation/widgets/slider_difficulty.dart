import 'package:flutter/material.dart';
import 'package:guess_the_number_fluttter/models/difficulty.dart';

class SliderDifficulty extends StatelessWidget {
  const SliderDifficulty({
    super.key,
    required this.currentDifficulty,
    required this.onDifficultyChanged,
  });

  final Difficulty currentDifficulty;
  final ValueChanged<Difficulty> onDifficultyChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(currentDifficulty.name),
          SizedBox(height: 10),
          Slider(
            value:
                Difficulty.allDifficulties
                    .indexOf(currentDifficulty)
                    .toDouble(),
            onChanged: (value) {
              onDifficultyChanged(Difficulty.fromIndex(value.round()));
            },
            min: 0,
            max: (Difficulty.allDifficulties.length - 1).toDouble(),
            divisions: Difficulty.allDifficulties.length - 1,
          ),
        ],
      ),
    );
  }
}
