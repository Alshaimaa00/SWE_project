import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
    child: AppBar(
          backgroundColor: const Color(0xFFA17135),
          title: const Text(
            'لعبة توصيل النقاط',
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

        body: const DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/Images/level1_backG.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
              children: [ GameScreen(),

    Padding(  //return button
    padding: const EdgeInsets.only(top: 7),
    child: Positioned(
    left: 5 * 38.5,
    child: Image.asset(
    'Assets/Images/return_BTN.jpg',
    width: 1.5 * 38.5826771654,
    height: 1.5 * 38.5826771654,
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
  final int requiredPoints = 2;
  int score = 0;
  int rollNumber = 0;
  bool correctPathSelected = false;
  late Timer timer;
  int remainingTime = 20;

void startTimer() {
      timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          remainingTime = max(0, remainingTime - 1);
        });

        if (remainingTime == 0) {
          timerMsg();
        }
      });
    }
  
  AudioPlayer player = AudioPlayer();
  void playSuccessMusic() {
    player.play(AssetSource("sound/success.mp3"));
  }

  //correct grid paths
  List<int> correctPathIndices = [23, 22, 21, 20, 15, 10, 5, 6, 7, 8, 9];
  List<List<int>> correctPathsIndicesList = [
    [23, 22, 21, 20, 15, 10, 5, 6, 7, 8, 9],
    [23, 18, 13, 8, 9],
    [23, 18, 17, 12, 7, 8, 9],
    [11, 12, 13, 14],
    [11, 16, 17, 18, 19, 14],
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

      startTimer();
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
              height: 73,
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '-قم بالنقر على المربعات لتظليلها,\n ومحاولة التوصيل بين العناصر المتشابهة-',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: "Cairo"),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            Text(
              'من 2 إحتمالات\t$score',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Cairo"),
            ),
            const SizedBox(
              height: 15,
            ),
            rollNumber == 2
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
                                ? Color(0xFFC9924A)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFFA17135),
                              width: 1.0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned( //2nd row فنجان
                    left: (8.9 % columns) * (310 / columns),
                    top: (7.2 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'Assets/Images/fng.jpg',
                        width: 57,
                        height: 70,
                      ),
                    ),
                  ),

                  Positioned( //bottom right فنجان
                    left: (2.88 % columns) * (315 / columns),
                    top: (20 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'Assets/Images/fng.jpg',
                        width: 57,
                        height: 70,
                      ),
                    ),
                  ),

                  Positioned( //left دلة
                    left: (6 % columns) * (350 / columns),
                    top: (10 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'Assets/Images/dah.jpg',
                        width: 45,
                        height: 66,
                      ),
                    ),
                  ),

                  Positioned( // right دلة
                    left: (9 % columns) * (310 / columns),
                    top: (10 ~/ columns) * (300 / rows),
                    child: IgnorePointer(
                      ignoring: true,
                      child: Image.asset(
                        'Assets/Images/dah.jpg',
                        width: 45,
                        height: 66,
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
              color: pressedStates[index] ? Colors.brown : Colors.transparent,
              border: Border.all(
                color: const Color(0xFFA17135),
                width: 1.0,
              ),
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  color: Colors.white,
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
        playSuccessMusic();
        rollNumber++;

        setState(() {
          score++;
          correctPathSelected = true;
        });
        _resetGame();

        if (rollNumber == 2) {
          _showDialog('                أحسنت \n لقد اخترت الطريق الصحيح!');
        }
      }
    } else {
      correctPathSelected = false;
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

  
 void timerMsg() {
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
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  
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
                    'Assets/Images/clapping-hands.png',
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
                child: const Text("OK"),
              ),
            ],
          ),
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
      ..strokeWidth = 2.0;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
