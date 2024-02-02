import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorGameApp());
}

class ColorGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorGameScreen(),
    );
  }
}

class ColorGameScreen extends StatefulWidget {
  @override
  _ColorGameScreenState createState() => _ColorGameScreenState();
}

class _ColorGameScreenState extends State<ColorGameScreen> {
  int score = 0;
  final List<ColorWordPair> colorWords = [
    ColorWordPair(color: Colors.yellow, word: 'احمر'),
    ColorWordPair(color: Colors.red, word: 'ازرق'),
    ColorWordPair(color: Colors.blue, word: 'اخضر'),
    ColorWordPair(color: Colors.green, word: 'اصفر'),
  ];

  ColorWordPair randomPair = ColorWordPair(color: Colors.white, word: '');
  late Timer timer;
  int remainingTime = 5;

  @override
  void initState() {
    super.initState();
    generateRandomPair();
    startTimer();
  }

  void generateRandomPair() {
    setState(() {
      randomPair = colorWords[Random().nextInt(colorWords.length)];
      remainingTime = 5;
    });
  }

  void startTimer() {//timer method
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        remainingTime = max(0, remainingTime - 1);
      });

      if (remainingTime == 0) {
        generateRandomPair();
      }
    });
  }

  void checkAnswer(Color selectedColor) {//check ans and inc score
    if (selectedColor == randomPair.color) {
      setState(() {
        score += 5;
      });
      generateRandomPair();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("!!خطأ"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  generateRandomPair();
                },
                child: Text('حاول مجددا'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تأثير ستروب'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/level1_backG.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 35.0,
            left: 185.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('عوده: ', style: TextStyle(fontSize: 16, color: Colors.black)),//score screen
                Text(score.toString(), style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'اختر اللون:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  randomPair.word,
                  style: TextStyle(
                    fontSize: 24,
                    color: randomPair.color,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'الوقت المتبقي: $remainingTime ثواني',//timer
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(Colors.yellow),
                    buildButton(Colors.red),
                    buildButton(Colors.blue),
                    buildButton(Colors.green),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        textStyle: TextStyle(fontSize: 16),
      ),
      onPressed: () {
        checkAnswer(color);
      },
      child: Text(''),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

class ColorWordPair {
  final Color color;
  final String word;

  ColorWordPair({required this.color, required this.word});
}
