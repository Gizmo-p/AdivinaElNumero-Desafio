import 'package:flutter/material.dart';

class GameInputController {
  final TextEditingController _textController = TextEditingController();
  String? _errorMessage;
  int minRange;
  int maxRange;
  GameInputController({this.minRange = 1, this.maxRange = 100});

  TextEditingController get textController => _textController;
  String? get errorMessage => _errorMessage;

  /// Validates the input and sets an error message if invalid.
  String? validateInput(String input) {
    if (input.trim().isEmpty) {
      return 'Por favor, ingrese un número';
    }

    // check if input contains only digits
    if (!RegExp(r'^\d+$').hasMatch(input.trim())) {
      return 'Por favor, ingrese solo números';
    }

    // try to parse the input as an integer
    try {
      final number = int.parse(input.trim());

      if (number < minRange || number > maxRange) {
        return 'El número debe estar entre $minRange y $maxRange';
      }
      return null;
    } catch (e) {
      return 'Por favor, ingrese un número válido';
    }
  }

  /// Clears the input field.
  void clearInput() {
    _textController.clear();
    _errorMessage = null;
  }

  /// Dispose the text controller to free up resources.
  void dispose() {
    _textController.dispose();
  }

  /// Processes the input from the text field.
  /// Returns the parsed integer or null if the input is invalid.
  int? processSubmission(String input) {
    _errorMessage = validateInput(input);

    if (_errorMessage != null) {
      return null; // Input is invalid
    }

    final number = int.parse(input.trim());
    clearInput();
    return number;
  }

  void setError(String? message) {
    _errorMessage = message;
  }

  void clearError() {
    _errorMessage = null;
  }

  /// Updates the range values for validation
  void updateRange(int newMinRange, int newMaxRange) {
    minRange = newMinRange;
    maxRange = newMaxRange;
  }
}
