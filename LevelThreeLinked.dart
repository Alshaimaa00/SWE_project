import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق الألوان',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstPage(),
    );
  }
}

class ColorWordPair {
  final Color color;
  final String word;

  ColorWordPair({required this.color, required this.word});
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF354B23),
        title: const Text(
          'تعليمات لعبة تأثير ستروب',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Cairo",
          ),
        ),
        centerTitle: true,),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/stroop_instruction_3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100.0), // زيادة التباعد العمودي
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColorGameScreen()),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorGameScreen extends StatefulWidget {
  @override
  _ColorGameScreenState createState() => _ColorGameScreenState();
}

class _ColorGameScreenState extends State<ColorGameScreen> {
  int score = 0;
  List<String> words = ['أحمر', 'أزرق', 'أخضر', 'برتقالي', 'بنفسجي', 'وردي'];
  List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.pink];

  Random random = Random();
  String word = '';
  Color textColor = Colors.black;
  late Timer timer;
  int remainingSeconds = 10;
  bool isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    countdown();
  }

  void countdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0 && isTimerRunning) {
        setState(() {
          remainingSeconds--;
        });
      } else if (isTimerRunning) {
        isTimerRunning = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondPage()),
        );
      }
    });
    generateQuestion();
  }
  void generateQuestion() {
    int index = random.nextInt(words.length);
    int colorIndex = random.nextInt(colors.length);
    word = words[index];
    textColor = colors[colorIndex];
  }

  void checkAnswer(isCorrect) {
    if (isCorrect) {
      setState(() {
        score+=3;
      });
      generateQuestion();
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
                  generateQuestion();
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
        backgroundColor: const Color(0xFF354B23),
        title: const Text(
          ' لعبة تأثير ستروب',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Cairo",
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/stroop_3_background.jpg',
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
                Text(': عودة ', style: TextStyle(fontSize: 20, color: Colors.black)),
              ],
            ),
          ),
          Positioned(
            top: 270.0,
            left: 120.0,
            child: Text(
              'الوقت المتبقي: $remainingSeconds ثواني',
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
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF354B23),
        title: const Text(
          'تعليمات لعبة توصيل العناصر',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: "Cairo",
          ),
        ),
        centerTitle: true,),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/object_instruction_3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100.0), // زيادة التباعد العمودي
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAp()),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class MyAp extends StatelessWidget {
  const MyAp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: const Color(0xFF354B23),
            title: const Text(
              'لعبة توصيل العناصر ',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: "Cairo",
              ),
            ),
            centerTitle: true,
          ),
        ),

        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/object_3_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [ const GameScreen(),

              //Padding(  //return button
              //padding: const  EdgeInsets.only(top: 5),
              //child: Positioned(
              //bottom: 700,
              //right: 400 ,
              //child: TextButton(
              //onPressed: (){
              //add logic
              //},
              /*child: Image.asset(
                      'Assets/Images/return_BTN (LVL3).png',
                      width: 1.75 * 38.582,
                      height: 2 * 38.582,
                    ),*/
              // ),
              //),
              //  ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Offset> points = [];
  int rows = 5;
  int columns = 5;
  List<bool> pressedStates = List.generate(25, (index) => false);
  int selectedPoints = 0;
  final int requiredPoints = 6;
  int score = 0; //number of tries
  int rollNumber = 0;
  bool correctPathSelected = false;
  late Timer timer;
  int remainingSeconds = 20;
  bool isTimerRunning = true;
  int scoreN=0; //players score

  /* void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        remainingTime = max(0, remainingTime - 1);
      });

      if (remainingTime == 0) {
        // timerMsg(" انتهى الوقت! ");
      }
    });
  }*/
  void countdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer)
    {
      if (remainingSeconds > 0 && isTimerRunning) {
        setState(() {
          remainingSeconds--;
        });
      } else if (isTimerRunning) {
        setState(() {
          isTimerRunning = false;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FifthScreen()),
          );
        });
      }
    });
  }

  //AudioPlayer player = AudioPlayer();
  //void playSuccessMusic() {
  //player.play(AssetSource("sound/success.mp3"));
  //}

  //correct grid paths
  List<int> correctPathIndices = [6,11,12,17,18,19,14,13];
  List<List<int>> correctPathsIndicesList = [
    [6,11,12,13], [6,11,12,17,18,13], //mnt paths
    [10,11,12,17,22,21], [10,15,20,21], //flwr paths
    [16,17,18,23], [16,17,22,23], //plt paths
    [9,14,19,24], //hll path
    [7,8,3,4], //pep path
    [2,1,0,5], //sdo path
  ];

  void _resetGame() {
    setState(() {
      points.clear();
      pressedStates = List.generate(25, (index) => false);
      correctPathSelected = false;
      userSelectedPath.clear();
    });
  }

  List<int> userSelectedPath = [];

  @override
  void initState() {
    correctPathSelected = false;
    super.initState();
    countdown();
  }

  @override
  Widget build(BuildContext context) {
    final ksize = MediaQuery
        .of(context)
        .size;
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          points.add(details.globalPosition);
          updateSquareColor(details.globalPosition);
        });
      },
      onTap: () {
        setState(() {
          int selectedSquare = getSelectedSquareIndex();
          if (selectedSquare != -1) {
            userSelectedPath.add(selectedSquare);
          }
        });
      },
      child: Center(
        child: Column(
          children: [
            const SizedBox(
                height: 43 ),
            Text(
              '     عودة\t${scoreN.toString()}',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),

                fontSize: 22,
                fontFamily: "Cairo",
              ),
            ),

            Text(
              '\n الوقت المتبقي: $remainingSeconds ثواني',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),

                  fontSize: 19,
                  fontFamily: "Cairo"),
            ),

            const SizedBox(
              height: 13,
            ),
            Text(
              'من 6 إحتمالات\t$score',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),

                  fontSize: 20,
                  fontFamily: "Cairo"),
            ),
            const SizedBox(
              height: 15,
            ),
            rollNumber == 6
                ? SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resetGame();
                    rollNumber = 0;
                    score = 0;
                  });
                }, child: null,
              ),
            ) :

            SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                children: [
                  buildGrid(),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rows,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: rows * columns,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            points.add(Offset(
                              (index % columns) * (300 / columns),
                              (index ~/ columns) * (300 / rows),
                            ));
                            pressedStates[index] = true;
                            selectedPoints++;
                            checkPoints();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: pressedStates[index]
                                ? const Color(0xFF005D22)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFF005D22),
                              width: 1.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  Positioned( //top row sdo
                    left: (12 % columns) * (310 / columns),
                    top: (2.7 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/sdo.jpeg',
                        width: 53,
                        height: 60,
                      ),
                    ),
                  ),

                  Positioned( //second row sdo
                    left: (5.06 % columns) * (340 / columns),
                    top: (6.8 ~/ columns) * (280/ rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/sdo.jpeg',
                        width: 49,
                        height: 60,
                      ),
                    ),
                  ),

                  Positioned( //top row pep
                    left: (13.5 % columns) * (350 / columns),
                    top: (2.5 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/men.jpeg',
                        width: 50,
                        height: 70,
                      ),
                    ),
                  ),

                  Positioned( // second row pep
                    left: (12 % columns) * (310 / columns),
                    top: (7 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/men.jpeg',
                        width: 50,
                        height: 70,
                      ),
                    ),
                  ),

                  Positioned( //second row mnt
                    left: (6 % columns) * (310 / columns),
                    top: (7 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/mnt.jpeg',
                        width: 55,
                        height: 60,
                      ),
                    ),
                  ),

                  Positioned( //third row mnt
                    left: (12.91 % columns) * (310 / columns),
                    top: (10.2 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/mnt.jpeg',
                        width: 55,
                        height: 61,
                      ),
                    ),
                  ),

                  Positioned( //third row flwr
                    left: (5.1 % columns) * (200 / columns),
                    top: (10.2 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/flwrl.jpeg',
                        width: 50,
                        height: 60,
                      ),
                    ),
                  ),

                  Positioned( //bottom row flwr
                    left: (6.1% columns) * (310 / columns),
                    top: (20.1 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/flwrl.jpeg',
                        width: 50,
                        height: 60,
                      ),
                    ),
                  ),

                  Positioned( //fourth row plt
                    left: (6 % columns) * (310 / columns),
                    top: (18 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/plt.jpeg',
                        width: 57,
                        height: 70,
                      ),
                    ),
                  ),

                  Positioned( //bottom row plt
                    left: (12.9 % columns) * (310 / columns),
                    top: (20.1 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/plt.jpeg',
                        width: 57,
                        height: 70,
                      ),
                    ),
                  ),

                  Positioned( //second row hll
                    left: (13.9 % columns) * (310 / columns),
                    top: (7.1 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/hll.jpeg',
                        width: 57,
                        height: 70,
                      ),
                    ),
                  ),

                  Positioned( //bottom row hll
                    left: (13.9 % columns) * (310 / columns),
                    top: (20.1 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'images/hll.jpeg',
                        width: 57,
                        height: 70,
                      ),
                    ),
                  ),

                  CustomPaint(painter: LinePainter(points),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: rows * columns,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              points.add(Offset(
                (index % columns) * (300 / columns),
                (index ~/ columns) * (300 / rows),
              ));
              pressedStates[index] = true;
              selectedPoints++;
              checkPoints();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: pressedStates[index] ? Colors.green : Colors.transparent,
              border: Border.all(
                color: const Color(0xFF45E729),
                width: 1.0,
              ),
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  color: Colors.transparent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  int getSelectedSquareIndex() {
    if (points.isEmpty) {
      return -1;
    }

    int row = (points.last.dy / (300 / rows)).floor();
    int column = (points.last.dx / (300 / columns)).floor();
    int index = row * columns + column;

    if (index >= 0 && index < pressedStates.length && !pressedStates[index]) {
      return index;
    } else {
      int selectedSquare = index;

      if (isSequentialSelection(selectedSquare)) {
        return selectedSquare;
      }
    }

    return -1;
  }

  bool isSequentialSelection(int selectedSquare) {
    if (userSelectedPath.isNotEmpty) {
      int lastSelectedSquare = userSelectedPath.last;
      int difference = selectedSquare - lastSelectedSquare;

      if (difference == 1 || difference == columns) {
        userSelectedPath.add(selectedSquare);

        return true;
      }
    } else {
      userSelectedPath.add(selectedSquare);
      return true;
    }

    return false;
  }

  void checkPoints() {
    if (!correctPathSelected) {
      bool isCorrectPath = checkCorrectPath();

      if (isCorrectPath) {
        //playSuccessMusic();
        rollNumber++;

        setState(() {
          correctPathSelected = true;
          score++;
          scoreN+=20;
        });
        _resetGame();

        if (rollNumber == 6) {
          _showDialog('                أحسنت \n لقد اخترت الطريق الصحيح!');
        }
      }
    } else {
      correctPathSelected = false;
      scoreN-=10;
    }
  }

  void updateSquareColor(Offset globalPosition) {
    int selectedSquare = getSelectedSquareIndex();

    if (selectedSquare != -1) {
      setState(() {
        pressedStates[selectedSquare] = true;
        selectedPoints++;
        checkPoints();
      });
    }
  }

  bool checkCorrectPath() {
    for (List<int> correctPathIndices in correctPathsIndicesList) {
      if (isCorrectPathForIndices(correctPathIndices)) {
        return true;
      }
    }
    return false;
  }

  bool isCorrectPathForIndices(List<int> correctPathIndices) {
    for (int index in correctPathIndices) {
      if (!pressedStates[index]) {
        return false;
      }
    }
    return true;
  }

  void checkUserPath() {
    // Check if the selected points form a correct path
    bool isCorrectPath = checkCorrectPath();

    setState(() {
      if (isCorrectPath) {
        for (int index in correctPathsIndicesList.expand((
            indices) => indices)) {
          pressedStates[index] = true;
        }
        points.clear();
      } else {
        for (int i = 0; i < pressedStates.length; i++) {
          if (pressedStates[i] && !correctPathIndices.contains(i)) {
            pressedStates[i] = false;
          }
        }
      }

      selectedPoints = 0;
      userSelectedPath.clear();
    });

    _showDialog(isCorrectPath ? 'تم اختيار المسار بنجاح' : 'مسار خاطئ');
  }


  double cmToPixels(double cm) {
    return cm * 38.5826771654;  }


  /*void timerMsg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("           !انتهى الوقت"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("X"),
            ),
          ],
        );
      },
    );
  }*/


  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            content: SizedBox(
              height: 250,
              child: Column(
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Cairo",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'images/hand.jpg',
                    width: 150,
                    height: 140,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("X"),
              ),
            ],
          ),
        );
      },
    );
  }void timerMsg() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("           !انتهى الوقت"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("X"),
            ),
          ],
        );
      },
    );
  }
}




class LinePainter extends CustomPainter {
  final List<Offset> points;

  LinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 0.5;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: const Color(0xFFA17135),
            title: const Text(
              'لعبة صور وكلمة',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: "Cairo",
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/inst_BKG(LVL3).png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [

              const Padding(
                padding: EdgeInsets.only(bottom: 279),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    ' خذ التعليمات قبل أن تنطلق\nستظهر لك الان لعبة صور وكلمة\nعليك  إكتشاف الرابط بين الصور\nوإختيار الحروف الملائمة لتشكيل كلمة الرابط!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "Cairo",
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width - 4 * 38.5826771654) / 2,
                bottom: 240,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>SixithScreen()),
                    );
                  },
                  child: Image.asset(
                    'images/go_BTN (LVL3).png',
                    width: 4 * 38.5826771654,
                    height: 3 * 38.5826771654,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SixithScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(' صور وكلمة')),
          backgroundColor: Color(0xFFFFCC80), // تم تغيير لون الخلفية هنا
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Third_Level_BKG.png'),
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
  String correctAnswer = 'السودة';
  List<String> letters = ["ة","ب","د","ج","ر","و","ط","س","ف","ل","ن","ا"];
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
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('انتهى الوقت!'),
            content: Text('إنتهى الوقت إضغط على التالي للإنتقال للخريطة'),
            actions: [
              TextButton(
                onPressed: () {
                  resetGame();

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
                Image.asset('images/jnob.jpg', width: 140, height: 140), // زيادة حجم الصورة هنا
                SizedBox(width: 20),
                Image.asset('images/dhay.jpg', width: 140, height: 140), // زيادة حجم الصورة هنا
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Color(0xFFFFCC80),
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
                      primary: Color(0xFF1B5E20), // تغيير لون الخلفية إلى الأزرق هنا
                    ),
                    child: Text(
                      letter,
                      style: TextStyle(color: Colors.white), // تغيير لون النص إلى الأسود هنا
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
                    primary: Colors.white, // تغيير لون الخلفية إلى الأزرق هنا
                  ),
                  child: Text(
                    'مسح',
                    style: TextStyle(color: Colors.black), // تغيير لون النص إلى الأسود هنا
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
                    score += 24;
                  });
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('ممتاز!'),
                      content: Text('إجابتك صحيحة.اضغط التالي للإنتقال للخريطة'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            resetGame();

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
                            resetGame();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>SixithScreen()),
                            );

                          },
                          child: Text('محاولة مجددا'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // تغيير لون الخلفية إلى الأزرق هنا
              ),
              child: Text(
                'تحقق',
                style: TextStyle(color: Colors.black), // تغيير لون النص إلى الأسود هنا
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment(0, -0.7),
          child: Text('الوقت المتبقي: $remainingSeconds ثواني', style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
        Align(
          alignment: Alignment(0, -0.87),
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