import 'package:flutter/material.dart';

class GameColumn extends StatelessWidget {
  const GameColumn({
    super.key,
    required this.title,
    required this.numbers,
    this.correctNumbers = const [],
    this.showColors = false,
  });
  final String title;
  final List<String> numbers;
  final List<String> correctNumbers;
  final bool showColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (BuildContext context, int index) {
                final number = numbers[index];
                final isCorrect = correctNumbers.contains(number);

                Color textColor;

                if (showColors) {
                  textColor = isCorrect ? Colors.green : Colors.red;
                } else {
                  textColor = Colors.grey;
                }
                return Center(
                  child: Text(
                    numbers[index],
                    style: TextStyle(color: textColor),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
