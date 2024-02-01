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
  double brightnessValue = 0.5; // Initial brightness value
  bool soundEnabled = true; // Initial sound state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اعدادات اللعبة'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.brightness_medium, size: 30),
                SizedBox(width: 10),
                Text(
                  'السطوع',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Slider(
              value: brightnessValue,
              onChanged: (value) {
                setState(() {
                  brightnessValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  soundEnabled ? Icons.volume_up : Icons.volume_off,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'الصوت',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Switch(
              value: soundEnabled,
              onChanged: (value) {
                setState(() {
                  soundEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
