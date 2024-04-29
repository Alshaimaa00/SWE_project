import 'package:flutter/material.dart';

void main() {
  runApp(MapScreen());
}

class MapScreen extends StatelessWidget {
  final int playerPoints = 60; // Example: Player points

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF4DDB8),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/mapBackgroundwo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 670,
              left: 0,
              right: 330,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Image.asset(
                    'Assets/returnbackWithBackground.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
            Positioned( // Level one
              top: 0,
              bottom: 350,
              left: 0,
              right: 130,
              child: Center(
                child: MapLevelButton(
                  level: 1,
                  pointsRequired: 0,
                  playerPoints: playerPoints,
                  unlockedImageAsset: 'Assets/najdButton.png',
                  lockedImageAsset: 'Assets/najdButton.png', // Same image for locked state
                ),
              ),
            ),
            Positioned( // Level three
              top: 350,
              bottom: 0,
              left: 0,
              right: 50,
              child: Center(
                child: MapLevelButton(
                  level: 3,
                  pointsRequired: 100,
                  playerPoints: playerPoints,
                  unlockedImageAsset: 'Assets/southButton.png',
                  lockedImageAsset: 'Assets/southBW.png',
                ),
              ),
            ),
            Positioned( // Level two
              top: 0,
              bottom: 0,
              left: 80,
              right: 0,
              child: Center(
                child: MapLevelButton(
                  level: 2,
                  pointsRequired: 50,
                  playerPoints: playerPoints,
                  unlockedImageAsset: 'Assets/eastButton.png',
                  lockedImageAsset: 'Assets/eastBW.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapLevelButton extends StatelessWidget {
  final int level;
  final int pointsRequired;
  final int playerPoints;
  final String unlockedImageAsset;
  final String lockedImageAsset;

  const MapLevelButton({
    Key? key,
    required this.level,
    required this.pointsRequired,
    required this.playerPoints,
    required this.unlockedImageAsset,
    required this.lockedImageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool canUnlock = playerPoints >= pointsRequired;
    return TextButton(
      onPressed: canUnlock
          ? () {
        // Navigate to the selected level
        print('Navigate to level $level');
      }
          : null,
      child: Image.asset(
        canUnlock ? unlockedImageAsset : lockedImageAsset,
        width: 250,
        height: 250,
      ),
    );
  }
}
