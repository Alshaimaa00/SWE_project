import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('ثلاث صور وكلمة')),
          backgroundColor: Color(0xFF90CAF9), 
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/level_two.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: MyGame(),
        ),
      ),
    );
  }
}

class MyGame extends StatefulWidget {
  @override
  _MyGameState createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  int score = 0;
  String selectedLetter = '';
  String correctAnswer = 'ارامكو';
  List<String> letters = ["ر","و","ط","ك","ف","م","ن","ا"];
  List<String> chosenLetters = [];
  int remainingSeconds = 20;
  bool isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    countdown();
  }

  void countdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (remainingSeconds > 0 && isTimerRunning) {
        setState(() {
          remainingSeconds--;
        });
        countdown();
      } else if (isTimerRunning) {
        isTimerRunning = false; //
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('انتهى الوقت!'),
            content: Text('انتهى الوقت، اضغط التالي للانتقال للخريطة.'),
            actions: [
              TextButton(
                onPressed: () {
                  resetGame(); //
                  Navigator.pop(context); // إ
                },
                child: Text('التالي'),
              ),
            ],
          ),
        );
      }
    });
  }

  void resetGame() {
    setState(() {
      selectedLetter = '';
      chosenLetters.clear();
      remainingSeconds = 15;
      isTimerRunning = true;
    });
    countdown();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/fozy.jpg', width: 124, height: 124), //
                SizedBox(width: 20),
                Image.asset('images/fozy2.jpg', width: 124, height: 124), //
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xFF90CAF9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                chosenLetters.join(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (String letter in letters)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedLetter = letter;
                        chosenLetters.add(letter);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE3F2FD), //
                    ),
                    child: Text(
                      letter,
                      style: TextStyle(color: Colors.black), //
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (chosenLetters.isNotEmpty) {
                      setState(() {
                        chosenLetters.removeLast();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, //
                  ),
                  child: Text(
                    'مسح',
                    style: TextStyle(color: Colors.black), //
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                isTimerRunning = false;
                String userAnswer = chosenLetters.join();
                if (userAnswer == correctAnswer) {
                  setState(() {
                    score += 50;
                  });
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('ممتاز!'),
                      content: Text('إجابتك صحيحة اذغط التالي للانتقال للخريطة'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            resetGame();
                            Navigator.pop(context);
                          },
                          child: Text('التالي'),
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('خطأ!'),
                      content: Text('حاول مجددًا.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            resetGame();
                            Navigator.pop(context);
                          },
                          child: Text('محاولة مجددا'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              child: Text(
                'تحقق',
                style: TextStyle(color: Colors.black), //
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment(0, -0.6),
          child: Text('الوقت المتبقي: $remainingSeconds ثواني', style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
        Align(
          alignment: Alignment(0, -0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('عودة ', style: TextStyle(fontSize: 16, color: Colors.black)),
              Text(score.toString(), style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
