import 'package:flutter/material.dart';

class SliderDifficulty extends StatefulWidget {
  const SliderDifficulty({super.key});

  @override
  State<SliderDifficulty> createState() => _SliderDifficultyState();
}

class _SliderDifficultyState extends State<SliderDifficulty> {
  // dummy list of difficulties would be replaced with actual data
  final List<String> difficulties = ['Facil', 'Medio', 'Avanzado', 'Extremo'];
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(difficulties[sliderValue.toInt()]),
          SizedBox(height: 10),
          Slider(
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
            min: 0,
            max: (difficulties.length - 1).toDouble(),
            divisions: 3,
          ),
        ],
      ),
    );
  }
}
