import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String computerHand = '✊';

  void selectHands(String selectedHand) {
    myHand = selectedHand;

    generatedComputerHand();
    setState(() {});
  }

  void generatedComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(computerHand, style: const TextStyle(fontSize: 32)),
            const SizedBox(
              height: 64,
            ),
            Text(myHand, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHands('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHands('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHands('✋');
                  },
                  child: const Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
