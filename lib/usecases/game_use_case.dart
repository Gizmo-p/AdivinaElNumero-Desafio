import 'dart:math';

import 'package:guess_the_number_fluttter/models/difficulty.dart';
import 'package:guess_the_number_fluttter/models/game_state.dart';
import 'package:guess_the_number_fluttter/models/guess.dart';

// centralize the game logic in a use case class
// start game, make guesses, validate guesses
class GameUseCase {
  // random number generator for secret number
  final Random _random = Random();

  // new game
  /// Starts a new game with the given difficulty.
  /// If [existingGlobalHistory] is provided, it will be used as the initial global history.
  /// Returns a new [GameState] with the secret number
  GameState startNewGame(
    Difficulty difficulty, {
    List<Guess>? existingGlobalHistory,
  }) {
    // Generate a random secret number based on the difficulty
    final secretNumber =
        _random.nextInt(
          difficulty.maxNumber -
              difficulty.minNumber +
              difficulty.minNumber +
              1,
        ) +
        difficulty.minNumber;

    return GameState(
      difficulty: difficulty,
      secretNumber: secretNumber,
      status: GameStatus.playing,
      history: [],
      globalHistory: existingGlobalHistory ?? [],
    );
  }

  /// Makes a guess in the current game state.
  /// Returns a new [GameState] with the updated history and status.

  GameState makeGuess(GameState currentState, int guessNumber) {
    GuessResult result;
    if (guessNumber == currentState.secretNumber) {
      result = GuessResult.correcto;
    } else if (guessNumber < currentState.secretNumber!) {
      result = GuessResult.mayorQue;
    } else {
      result = GuessResult.menorQue;
    }
    // creates a guess object for the current guess
    final guess = Guess(
      number: guessNumber,
      result: result,
      difficulty: currentState.difficulty,
    );
    // we need to add the guess to the current state
    return currentState.addGuess(guess);
  }

  /// validates if a guess is valid:
  /// - must be within the difficulty range
  bool isValidGuess(GameState gameState, int guess) {
    return guess >= gameState.difficulty.minNumber &&
        guess <= gameState.difficulty.maxNumber;
  }
}
