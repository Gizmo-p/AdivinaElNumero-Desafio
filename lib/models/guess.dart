import 'package:guess_the_number_fluttter/models/difficulty.dart';

enum GuessResult { mayorQue, menorQue, correcto }

class Guess {
  const Guess({
    required this.number,
    required this.result,
    required this.difficulty,
  });

  final int number;
  final GuessResult result;
  final Difficulty difficulty;

  // also for debug printing
  @override
  String toString() => '$number';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Guess &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          result == other.result;

  @override
  int get hashCode => number.hashCode ^ result.hashCode;
}
