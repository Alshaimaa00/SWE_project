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
        title: Text(
          'اعدادات اللعبة',
          style: TextStyle(color: Colors.brown), // Brown color for app bar title
        ),
        centerTitle: true, // Center align the title
        backgroundColor: const Color(0xFF966C50), // Background color of the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown), // Brown color for back icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container( // Added Container as a parent widget
        decoration: const BoxDecoration( // Decoration for the Container to set the background image
          image: DecorationImage(
            image: AssetImage('images/مفازة.png'), // Replace 'background_image.jpg' with your asset path
            fit: BoxFit.cover, // Cover the entire container
          ),
        ),
        child: Center( // Center widget to align everything in the middle
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centering vertically
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Aligns text to the right
                  children: [
                    Text(
                      'السطوع',
                      style: TextStyle(fontSize: 20, color: Colors.brown), // Brown color
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
                  activeColor: Colors.brown, // Set the active color of the Slider to brown
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Aligns text to the right
                  children: [
                    Text(
                      'الصوت',
                      style: TextStyle(fontSize: 20, color: Colors.brown), // Brown color
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Added space between text and Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Aligns Switch to the center
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Switch(
                        value: soundEnabled,
                        onChanged: (value) {
                          setState(() {
                            soundEnabled = value;
                          });
                        },
                        activeTrackColor: Colors.brown, // Brown color for Switch active track
                        activeColor: Colors.white, // Brown color for Switch thumb when active
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
