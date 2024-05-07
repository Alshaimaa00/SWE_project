import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(GameSettingsApp());
}

class GameSettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double brightnessValue = 0.5; // Initial brightness value (50%)

  bool soundEnabled = true; // Initial sound state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اعدادات اللعبة',
          style: TextStyle(color: Colors.brown), // Brown color for app bar title
        ),
        centerTitle: true, // Center align the title
        backgroundColor:
        const Color(0xFF966C50), // Background color of the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          // Brown color for back icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/مفازة.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(brightnessValue),
              // Adjust background brightness
              BlendMode.darken, // Adjust blend mode as needed
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'السطوع',
                      style: TextStyle(fontSize: 20, color: Colors.brown),
                    ),
                  ],
                ),
                // Flipped Slider
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi), // Rotate 180 degrees
                  child: Slider(
                    // Set initial value to 1.0 (100%) - maximum brightness
                    value: 1.0 - brightnessValue,
                    onChanged: (value) {
                      setState(() {
                        // Invert the value to correspond to brightness (0% to 100%)
                        brightnessValue = 1.0 - value;
                      });
                    },
                    activeColor: Colors.brown,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'الصوت',
                      style: TextStyle(fontSize: 20, color: Colors.brown),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi), // Rotate 180 degrees horizontally
                      child: Switch(
                        value: soundEnabled,
                        onChanged: (value) {
                          setState(() {
                            soundEnabled = value;
                          });
                        },
                        activeTrackColor: Colors.brown,
                        activeColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
