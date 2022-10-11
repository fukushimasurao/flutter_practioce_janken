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
  String result = '勝負！';

  int intVsCount = 0;
  String strVsCount = '0';

  int intWinCount = 0;
  String strWinCount = '0';

  int intLoseCount = 0;
  String strLoseCount = '0';

  int intDrawCount = 0;
  String strDrawCount = '0';

  void selectHands(String selectedHand) {
    myHand = selectedHand;
    generatedComputerHand();
    getResult();
    vsCountUp();
    setState(() {});
  }

  void reset() {
    strVsCount = '0';
    strWinCount = '0';
    strLoseCount = '0';
    strDrawCount = '0';
    setState(() {});
  }

  void generatedComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  void getResult() {
    if (myHand == computerHand) {
      drawCountUp();
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '✋' ||
        myHand == '✋' && computerHand == '✊') {
      winCountUp();
      result = 'あなたの勝ち';
    } else {
      loseCountUp();
      result = 'あなたの負け';
    }
  }

  void vsCountUp() {
    intVsCount++;
    strVsCount = intVsCount.toString();
  }

  void winCountUp() {
    intWinCount++;
    strWinCount = intWinCount.toString();
  }

  void loseCountUp() {
    intLoseCount++;
    strLoseCount = intLoseCount.toString();
  }

  void drawCountUp() {
    intDrawCount++;
    strDrawCount = intDrawCount.toString();
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
            Text("対戦回数 : $strVsCount", style: const TextStyle(fontSize: 32)),
            const SizedBox(
              height: 12,
            ),
            Text("勝利回数 : $strWinCount", style: const TextStyle(fontSize: 32)),
            const SizedBox(
              height: 12,
            ),
            Text("負け回数 : $strLoseCount", style: const TextStyle(fontSize: 32)),
            const SizedBox(
              height: 12,
            ),
            Text("引き分け回数 : $strDrawCount",
                style: const TextStyle(fontSize: 32)),
            const SizedBox(
              height: 32,
            ),
            Text(result, style: const TextStyle(fontSize: 32)),
            const SizedBox(
              height: 64,
            ),
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
            ElevatedButton(
              onPressed: () {
                reset();
              },
              child: const Text('リセット'),
            ),
          ],
        ),
      ),
    );
  }
}
