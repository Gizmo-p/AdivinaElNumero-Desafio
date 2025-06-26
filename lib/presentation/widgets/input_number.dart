import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_the_number_fluttter/presentation/controllers/input_number_controller.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({
    super.key,
    required this.attemptsRemaining,
    this.onGuessSubmitted,
    required this.minRange,
    required this.maxRange,
  });

  final int attemptsRemaining;
  final ValueChanged<int>? onGuessSubmitted;
  final int minRange;
  final int maxRange;

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  late final GameInputController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GameInputController(
      minRange: widget.minRange,
      maxRange: widget.maxRange,
    );
  }

  // Ensure the controller updates its range when the widget is updated
  // This is useful if the minRange or maxRange changes during the game
  @override
  void didUpdateWidget(InputNumber oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.minRange != widget.minRange ||
        oldWidget.maxRange != widget.maxRange) {
      _controller.updateRange(widget.minRange, widget.maxRange);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final input = _controller.textController.text;
    if (input.trim().isEmpty) {
      _controller.setError('Por favor ingresa un número');
      setState(() {});
      return;
    }

    final number = _controller.processSubmission(input);

    if (number != null) {
      widget.onGuessSubmitted?.call(number);
    }

    setState(() {});
  }

  void _onTextChanged(String value) {
    if (_controller.errorMessage != null) {
      _controller.clearError();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              width: 150,
              height: 40,
              child: TextField(
                controller: _controller.textController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          _controller.errorMessage != null
                              ? Colors.red
                              : Colors.grey,
                    ),
                  ),
                  hintText: 'Numbers',
                ),
                onChanged: _onTextChanged,
                onSubmitted: (_) => _handleSubmit(),
              ),
            ),
            if (_controller.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _controller.errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: [Text('Intentos'), Text('${widget.attemptsRemaining}')],
        ),
      ],
    );
  }
}
