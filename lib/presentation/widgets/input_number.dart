import 'package:flutter/material.dart';

class InputNumber extends StatefulWidget {
  const InputNumber({super.key});

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Numbers',
            ),
          ),
        ),
        SizedBox(width: 40),
        Column(children: [Text('Intentos'), Text('0')]),
      ],
    );
  }
}
