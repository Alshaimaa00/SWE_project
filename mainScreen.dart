import 'package:flutter/material.dart';
import 'package:mafaza/rewardsScreen.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9E5C5),
        ),
        body: Stack(
          children: [
            Container(
        decoration: BoxDecoration(
         // background: Color(0xFFF9E5C5), // Adjust opacity as needed
            )),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/mainBackground1.png'),
                  fit: BoxFit.cover,
                ),
              ),

            ),

            Positioned(
              top: 100,
              bottom: 0, 
              left: 0,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () {

                  },
                  child: Image.asset(
                    'Assets/StartButton.png',
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 600,
              left: 0,
              right: 300,
              child: Center(
                child: TextButton(
                  onPressed: () {
                  },
                  child: Image.asset(
                    'Assets/settingButton.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 600,
              left: 300,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => rewardsScreen()),
                    );},
                  child: Image.asset(
                    'Assets/rewardsButton.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 430,
              left: 300,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () {
                  },
                  child: Image.asset(
                    'Assets/mapButton.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
