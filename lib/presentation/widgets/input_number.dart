import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_the_number_fluttter/presentation/controllers/input_number_controller.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({
    super.key,
    required this.attemptsRemaining,
    this.onGuessSubmitted,
  });

  final int attemptsRemaining;
  final ValueChanged<int>? onGuessSubmitted;

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  late final GameInputController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GameInputController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final input = _controller.textController.text;
    final number = _controller.processSubmission(input);
    if (number != null) {
      widget.onGuessSubmitted?.call(number);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 40,
          child: TextField(
            controller: _controller.textController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Numbers',
            ),
            onSubmitted: (_) => _handleSubmit(),
          ),
        ),
        SizedBox(width: 40),
        Column(
          children: [Text('Intentos'), Text('${widget.attemptsRemaining}')],
        ),
      ],
    );
  }
}
