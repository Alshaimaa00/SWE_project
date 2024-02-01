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
          title: Text('ثلاث صور وكلمة'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/aied.jpg'),
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
  String selectedLetter = '';
  String correctAnswer = 'احتطاب';
  List<String> letters = ['ا', 'ح', 'ت', 'ط', 'ب', 'س', 'ل', 'و', 'ى'];
  List<String> chosenLetters = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/Ashwag.jpg', width: 100, height: 100),
            Image.asset('images/shatti.jpg', width: 100, height: 100),
            Image.asset('images/momo.jpg', width: 100, height: 100),
          ],
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

                child: Text(letter),
              ),
          ],
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (String letter in chosenLetters)
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.brown[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(letter, style: TextStyle(fontSize: 20)),
              ),
          ],
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (chosenLetters.join() == correctAnswer) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('ممتاز!'),
                  content: Text('إجابتك صحيحة.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedLetter = '';
                          chosenLetters.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Text('موافق'),
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
                        setState(() {
                          selectedLetter = '';
                          chosenLetters.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Text('محاولة مجددا'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Text('تحقق'),
        ),
      ],
    );
  }
}