import 'package:flutter/material.dart';

class GameColumn extends StatelessWidget {
  const GameColumn({
    super.key,
    required this.title,
    required this.numbers,
    this.correctNumbers = const [],
    this.numbersStatus = const [],
    this.showColors = false,
  });
  final String title;
  final List<String> numbers;
  final List<String> correctNumbers;
  final List<bool> numbersStatus;
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

                Color textColor;

                // Determine the text color based on the status or correctness on each game session
                if (showColors) {
                  if (numbersStatus.isNotEmpty &&
                      index < numbersStatus.length) {
                    textColor =
                        numbersStatus[index] ? Colors.green : Colors.red;
                  } else {
                    final isCorrect = correctNumbers.contains(number);
                    textColor = isCorrect ? Colors.green : Colors.red;
                  }
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
