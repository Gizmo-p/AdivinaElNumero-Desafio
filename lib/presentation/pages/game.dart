import 'package:flutter/material.dart';
import 'package:guess_the_number_fluttter/models/difficulty.dart';
import 'package:guess_the_number_fluttter/models/game_state.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/columns_section.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/input_number.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/slider_difficulty.dart';
import 'package:guess_the_number_fluttter/usecases/game_use_case.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  GameState? _gameState;
  final GameUseCase _gameUseCase = GameUseCase();

  @override
  void initState() {
    super.initState();
    startGame(Difficulty.facil);
  }

  void startGame(Difficulty difficulty) {
    setState(() {
      final existingGlobalHistory = _gameState?.globalHistory ?? [];
      _gameState = _gameUseCase.startNewGame(
        difficulty,
        existingGlobalHistory: existingGlobalHistory,
      );
      currentDifficulty = difficulty;
    });
  }

  void _handleGuess(int guess) {
    if (_gameState == null) return;

    final newState = _gameUseCase.makeGuess(_gameState!, guess);
    setState(() {
      _gameState = newState;
    });

    if (_gameState?.status == GameStatus.won) {
      startGame(_gameState!.difficulty);
    } else if (_gameState?.status == GameStatus.notStarted) {
      startGame(_gameState!.difficulty);
    }
  }

  Difficulty currentDifficulty = Difficulty.facil;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //Numbers input and attempts
            InputNumber(
              attemptsRemaining: _gameState!.attemptsRemaining,
              onGuessSubmitted: _handleGuess,
            ),
            SizedBox(height: 20),
            //Columns section with three columns
            ColumnsSection(gameState: _gameState!),
            SizedBox(height: 40),
            SliderDifficulty(
              currentDifficulty: currentDifficulty,
              onDifficultyChanged: (newDifficulty) {
                startGame(newDifficulty);
              },
            ),
          ],
        ),
      ),
    );
  }
}
