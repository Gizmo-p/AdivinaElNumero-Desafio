import 'package:flutter/material.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/columns_section.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/input_number.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/slider_difficulty.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //Numbers input and attempts
            InputNumber(),
            SizedBox(height: 20),
            //Columns section with three columns
            ColumnsSection(),
            SizedBox(height: 40),
            SliderDifficulty(),
          ],
        ),
      ),
    );
  }
}
