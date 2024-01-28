import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'Assets/Images/mScreen.jpg',
                fit: BoxFit.cover,
              ),
            ),


            Positioned( //play button
              top: cmToPixels(11),
              left: cmToPixels(3),
              child: Image.asset(
                'Assets/Images/ply_BTN.jpg',
                width: cmToPixels(4),
                height: cmToPixels(4),
              ),
            ),

            Positioned( //settings button
              top: cmToPixels(1),
              left: cmToPixels(0.3),
              child: Image.asset(
                'Assets/Images/stngs_BTN.jpg',
                width: cmToPixels(2),
                height: cmToPixels(2),
              ),
            ),

            Positioned( //rewards button
              top: cmToPixels(0.8),
              left: cmToPixels(8),
              child: Image.asset(
                'Assets/Images/rwrds_BTN.jpg',
                width: cmToPixels(2),
                height: cmToPixels(2),
              ),
            ),

            Positioned( //map button
              top: cmToPixels(2.8),
              left: cmToPixels(8),
              child: Image.asset(
                'Assets/Images/map_BTN.jpg',
                width: cmToPixels(2),
                height: cmToPixels(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double cmToPixels(double cm) {
    // Assuming 1cm = 38.5826771654 pixels (adjust this based on your requirement)
    return cm * 38.5826771654;
  }
}
