import 'package:flutter/material.dart';

class GameColumn extends StatelessWidget {
  const GameColumn({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: [Text(title), SizedBox(height: 10)]),
    );
  }
}
