import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(StroopGame());
}

class StroopGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stroop Game',
      home: StroopGamePage(),
    );
  }
}

class StroopGamePage extends StatefulWidget {
  @override
  _StroopGamePageState createState() => _StroopGamePageState();
}

class _StroopGamePageState extends State<StroopGamePage> {
  List<String> words = ['أحمر', 'أزرق', 'أخضر', 'برتقالي', 'بنفسجي', 'وردي'];
  List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.pink];

  Random random = Random();
  String word = '';
  Color textColor = Colors.black;
  int score = 0;
  late Timer timer;
  int timeLeft = 5;

  @override
  void initState() {
    super.initState();
    generateQuestion();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          timeLeft = 5; // إعادة تعيين الوقت للسؤال التالي
          generateQuestion(); // التحول إلى السؤال التالي
          startTimer(); // بدء التايمر للسؤال الجديد
        }
      });
    });
  }

  void generateQuestion() {
    int index = random.nextInt(words.length);
    int colorIndex = random.nextInt(colors.length);
    word = words[index];
    textColor = colors[colorIndex];
  }

  void checkAnswer(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        score++;
      });
    } else {
      // Handle incorrect answer
    }
    generateQuestion();
    timeLeft = 5; // إعادة تعيين الوقت للسؤال الجديد
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF354B23),
        title: Text('تاثير ستروب'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'asset/level_three.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60.0,
            left: 185.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(score.toString(), style: TextStyle(fontSize: 20, color: Colors.black)),
                Text(': عوده', style: TextStyle(fontSize: 20, color: Colors.black)),
              ],
            ),
          ),
          Positioned(
            top: 250.0,
            left: 120.0,
            child: Text(
              'الوقت المتبقي: $timeLeft ثواني',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ':اختر لون الكلمة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40.0),
              ),
              SizedBox(height: 1.0),
              Text(
                word,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36.0, color: textColor),
              ),
              SizedBox(height: 90.0),
              Wrap(
                alignment: WrapAlignment.center,
                children: List<Widget>.generate(
                  words.length,
                      (index) => ElevatedButton(
                    onPressed: () => checkAnswer(textColor == colors[index]),
                    child: Text(words[index]),
                    style: ElevatedButton.styleFrom(primary: colors[index]),
                  ),
                ),
              ),
              SizedBox(height: 200.0),
            ],
          ),
        ],
      ),
    );
  }}