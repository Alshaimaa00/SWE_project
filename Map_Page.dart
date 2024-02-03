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
                'Assets/Images/map_screen.jpg',
                fit: BoxFit.cover,
              ),
            ),

            Positioned( //return button
              top: cmToPixels(0.8),
              left: cmToPixels(0.1),
              child: Image.asset(
                'Assets/Images/return_map.jpg',
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
