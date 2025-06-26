import 'package:guess_the_number_fluttter/models/difficulty.dart';
import 'package:guess_the_number_fluttter/models/guess.dart';

enum GameStatus { notStarted, playing, won, lost }

class GameState {
  const GameState({
    this.secretNumber,
    required this.difficulty,
    this.history = const [],
    this.status = GameStatus.notStarted,
    this.globalHistory = const [],
  });

  final int? secretNumber;
  final Difficulty difficulty;
  final List<Guess> history;
  final GameStatus status;
  final List<Guess> globalHistory;

  // ==== STATE GETTERS AND ATTEMPT FILTERING ====

  int get attemptsUsed => history.length;
  int get attemptsRemaining => difficulty.maxAttempts - attemptsUsed;
  bool get isGameOver => status == GameStatus.won || status == GameStatus.lost;

  /// Numbers that are higher than the secret number
  List<int> get higherNumbers =>
      history
          .where((guess) => guess.result == GuessResult.mayorQue)
          .map((guess) => guess.number)
          .toList()
        ..sort();

  /// Numbers that are lower than the secret number
  /// descending order
  List<int> get lowerNumbers =>
      history
          .where((guess) => guess.result == GuessResult.menorQue)
          .map((guess) => guess.number)
          .toList()
        ..sort((a, b) => b.compareTo(a));

  /// All guesses made in the game, sorted in descending order
  List<int> get allGuesses =>
      history.map((guess) => guess.number).toList()
        ..sort((a, b) => b.compareTo(a));

  /// correct guesses (current game session)
  List<int> get correctNumbers =>
      history
          .where((guess) => guess.result == GuessResult.correcto)
          .map((guess) => guess.number)
          .toList();

  /// correct guesses (on every game session)
  List<int> get historialCorrectNumbers =>
      globalHistory
          .where((guess) => guess.result == GuessResult.correcto)
          .map((guess) => guess.number)
          .toList();

  /// final list of numbers that were guessed correctly or incorrectly
  List<int> get historialNumbers {
    List<int> result = [];
    List<Guess> currentSession = [];

    for (final guess in globalHistory) {
      currentSession.add(guess);

      if (guess.result == GuessResult.correcto) {
        // if the guess is correct, add it to the result
        // and clear the current session
        result.add(guess.number);
        currentSession.clear();
      } else {
        final maxAttempts = guess.difficulty.maxAttempts;
        if (currentSession.length >= maxAttempts) {
          result.add(currentSession.last.number);
          currentSession.clear();
        }
      }
    }
    // if there are remaining guesses in the current session, add the last one
    if (currentSession.isNotEmpty &&
        currentSession.length >= difficulty.maxAttempts) {
      result.add(currentSession.last.number);
    }

    return result;
  }

  /// ==== GAME STATE METHODS ====

  // adds a new guess to the game state
  // updates the history and globalHistory
  GameState addGuess(Guess guess) {
    final newHistory = [...history, guess];
    final newGlobalHistory = [...globalHistory, guess];

    GameStatus newStatus;
    if (guess.result == GuessResult.correcto) {
      newStatus = GameStatus.won;
    } else if (newHistory.length >= difficulty.maxAttempts) {
      // if the maximum number of attempts is reached, a new secret number is generated
      return GameState(
        difficulty: difficulty,
        secretNumber: null,
        status: GameStatus.notStarted,
        history: [],
        globalHistory: newGlobalHistory,
      );
    } else {
      newStatus = GameStatus.playing;
    }

    return GameState(
      difficulty: difficulty,
      secretNumber: secretNumber,
      status: newStatus,
      history: newHistory,
      globalHistory: newGlobalHistory,
    );
  }

  // creates a new state copy, allowing to modify some properties
  GameState copyWith({
    int? secretNumber,
    Difficulty? difficulty,
    List<Guess>? history,
    List<Guess>? globalHistory,
    GameStatus? status,
  }) {
    return GameState(
      secretNumber: secretNumber ?? this.secretNumber,
      difficulty: difficulty ?? this.difficulty,
      history: history ?? this.history,
      status: status ?? this.status,
      globalHistory: globalHistory ?? this.globalHistory,
    );
  }

  // start a new game with a new secret random number generated based on the difficulty

  GameState startGame(int newSecretNumber) {
    return GameState(
      difficulty: difficulty,
      secretNumber: newSecretNumber,
      status: GameStatus.playing,
      history: [],
      globalHistory: globalHistory,
    );
  }

  // reset the game state, allowing to change the difficulty
  GameState reset({Difficulty? newDifficulty}) {
    return GameState(
      difficulty: newDifficulty ?? difficulty,
      history: [],
      globalHistory: globalHistory,
    );
  }

  // for debug printing
  @override
  String toString() {
    return 'GameState(status: $status, attempts: $attemptsUsed/${difficulty.maxAttempts}, difficulty: ${difficulty.name})';
  }
}
