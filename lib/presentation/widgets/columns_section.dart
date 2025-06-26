import 'package:flutter/material.dart';
import 'package:guess_the_number_fluttter/presentation/widgets/column.dart';

class ColumnsSection extends StatelessWidget {
  const ColumnsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 100,
          height: 250,
          child: GameColumn(title: 'Mayor que'),
        ),
        SizedBox(
          width: 100,
          height: 250,
          child: GameColumn(title: 'Menor que'),
        ),
        SizedBox(
          width: 100,
          height: 250,
          child: GameColumn(title: 'Historial'),
        ),
      ],
    );
  }
}
