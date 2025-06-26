import 'package:flutter/material.dart';

class GameInputController {
  final TextEditingController _textController = TextEditingController();

  TextEditingController get textController => _textController;

  //Todo: validate input

  /// Clears the input field.
  void clearInput() {
    _textController.clear();
  }

  /// Dispose the text controller to free up resources.
  void dispose() {
    _textController.dispose();
  }

  /// Processes the input from the text field.
  /// Returns the parsed integer or null if the input is invalid.
  int? processSubmission(String input) {
    final number = int.parse(input.trim());
    clearInput();
    return number;
  }
}
