import 'package:flutter/material.dart';
import 'package:guess_the_number_fluttter/presentation/pages/game.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivina el número',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Adivina el Número',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          // Button without any action according to the example video
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        ),
        body: Game(),
      ),
    );
  }
}
