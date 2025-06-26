enum DifficultyLevel { facil, medio, avanzado, extremo }

class Difficulty {
  const Difficulty._({
    required this.level,
    required this.name,
    required this.minNumber,
    required this.maxNumber,
    required this.maxAttempts,
  });

  final DifficultyLevel level;
  final String name;
  final int minNumber;
  final int maxNumber;
  final int maxAttempts;

  //constructors for each difficulty level

  static const Difficulty facil = Difficulty._(
    level: DifficultyLevel.facil,
    name: 'Fácil',
    minNumber: 1,
    maxNumber: 10,
    maxAttempts: 5,
  );
  static const Difficulty medio = Difficulty._(
    level: DifficultyLevel.medio,
    name: 'Medio',
    minNumber: 1,
    maxNumber: 20,
    maxAttempts: 8,
  );
  static const Difficulty avanzado = Difficulty._(
    level: DifficultyLevel.avanzado,
    name: 'Avanzado',
    minNumber: 1,
    maxNumber: 100,
    maxAttempts: 15,
  );
  static const Difficulty extremo = Difficulty._(
    level: DifficultyLevel.extremo,
    name: 'Extremo',
    minNumber: 1,
    maxNumber: 1000,
    maxAttempts: 25,
  );

  // List of all difficulties
  static const List<Difficulty> allDifficulties = [
    facil,
    medio,
    avanzado,
    extremo,
  ];

  // Method to get a difficulty by its index
  // easiest way to access difficulties on the slider
  static Difficulty fromIndex(int index) {
    if (index < 0 || index >= allDifficulties.length)
      return facil; // Default to easy if index is out of range
    return allDifficulties[index];
  }

  // Method to get a difficulty by its level
  static Difficulty fromLevel(DifficultyLevel level) {
    return allDifficulties.firstWhere(
      (difficulty) => difficulty.level == level,
    );
  }

  //easier way to access difficulty name
  @override
  String toString() => name;

  // Override boolean equality for comparing Difficulty objects
  // so Difficulty.medio == Difficulty.fromLevel(DifficultyLevel.medio) will return true
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Difficulty &&
          runtimeType == other.runtimeType &&
          level == other.level;

  @override
  int get hashCode => level.hashCode;
}
