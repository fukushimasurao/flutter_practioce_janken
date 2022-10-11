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
  String myHand = '✊!!';

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
            Text(myHand, style: TextStyle(fontSize: 32)),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    myHand = '✊!!';
                    print('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    myHand = '✌️!!';
                    print('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    myHand = '✋!!';
                    print('✋');
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
